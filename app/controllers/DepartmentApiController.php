<?php

class DepartmentApiController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }

    public function loadAction()
    {
        $this->view->disable();
        $departments = Department::query()->columns(['id', 'name'])->execute();
        $resultSet = [];
        foreach ($departments as $department) {
            array_push($resultSet, [
                'id' => $department->id,
                'name' => $department->name
            ]);
        }
        echo json_encode($resultSet);
    }

    public function fullLoadAction()
    {
        $this->view->disable();
        $columns = ['id', 'name'];

        $departments = Department::query()
            ->limit($this->request->get('length'), $this->request->get('start'));
        $columnToOrder = $this->request->get('order')[0]['column'];
        if ($columnToOrder < 2) {
            $departments = $departments->orderBy($columns[$columnToOrder] . ' ' . $this->request->get('order')[0]['dir']);
        }

        // Search username
        $searchText = $this->request->get('search')['value'];
        if ($searchText) {
            $departments = $departments->andWhere('name LIKE :search_val:')
                ->bind(['search_val' => "%{$searchText}%"], true);
        }

        $departments = $departments->execute();

        $resultSet = [];
        foreach ($departments as $department) {
            array_push($resultSet, [
                $department->id,
                $department->name,
                Account::count([
                    'departmentId = :department_id:',
                    'bind' => ['department_id' => $department->id]
                ])
            ]);
        }
        $response = json_encode([
            'draw' => $this->request->get('draw') ? intval($this->request->get('draw')) : 0,
            'recordsTotal' => count($departments),
            'recordsFiltered' => count($departments),
            'data' => $resultSet
        ]);
        echo $response;
    }

    public function addAction()
    {
        $this->view->disable();
        $name = $this->request->getPost('name');
        if (!isset($name)) {
            echo json_encode(['success' => false, 'msg' => 'Please fill in all required fields.']);
        } else {
            $newDepartment = new Department();
            $newDepartment->name = $name;
            if ($newDepartment->save()) {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'msg' => 'Can\'t save new department.']);
            }
        }
    }

    public function deleteAction()
    {
        $this->view->disable();
        $id = $this->request->getPost('id');
        if (!isset($id)) {
            echo json_encode(['success' => false, 'msg' => 'Missing department id to be deleted.']);
        } else {
            $department = Department::findFirst($id);
            if (!$department) {
                echo json_encode(['success' => false, 'msg' => 'Department id is not valid.']);
            } else {
                if (Account::count([
                        'departmentId = :department_id:',
                        'bind' => ['department_id' => $id]
                    ]) > 0) {
                    echo json_encode(['success' => false, 'msg' => 'Department must not have any staff in order to be deleted.']);
                } else if(!$department->delete()) {
                    echo json_encode(['success' => false, 'msg' => 'Can\'t delete this department.']);
                } else {
                    echo json_encode(['success' => true]);
                }
            }
        }
    }

    public function editAction()
    {
        $id = $this->request->getPost('id');
        $name = $this->request->getPost('name');
        if (!isset($id, $name)) {
            echo json_encode(['success' => false, 'msg' => 'Missing field(s).']);
        } else {
            $department = Department::findFirst($id);
            if (!$department) {
                echo json_encode(['success' => false, 'msg' => 'Department id is not valid.']);
            } else {
                $department->name = $name;
                if (!$department->update()) {
                    echo json_encode(['success' => false, 'msg' => 'Can\'t save this department.']);
                } else {
                    echo json_encode(['success' => true]);
                }
            }
        }

    }
}