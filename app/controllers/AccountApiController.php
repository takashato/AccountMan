<?php

class AccountApiController extends \Phalcon\Mvc\Controller
{
    public function indexAction()
    {

    }

    public function loadAction()
    {
        $this->view->disable();
        $columns = ['id', 'username', 'email', 'fullname', 'gender', 'departmentId', 'birthday', 'createDate', 'lastUpdateDate'];

        $accounts = Account::query()
            ->limit($this->request->get('length'), $this->request->get('start'))
            ->orderBy($columns[$this->request->get('order')[0]['column']] . ' ' . $this->request->get('order')[0]['dir']);

        // Filter
        $filter = $this->request->get("extra_search");
        if (isset($filter)) {
            $accounts = $accounts->inWhere('departmentId', $filter);
        }

        // Search username
        $searchText = $this->request->get('search')['value'];
        if ($searchText) {
            $accounts = $accounts->andWhere('username LIKE :search_val:')
                -> bind(['search_val' => "%{$searchText}%"], true);
        }

        $accounts = $accounts->execute();

        $resultSet = [];
        foreach ($accounts as $account) {
            array_push($resultSet, [
                $account->id,
                $account->username,
                $account->email,
                $account->fullname,
                $account->gender == 1 ? "Male" : "Female",
                $account->department->name,
                $account->department->id,
                (new DateTime($account->birthday))->format("d/m/Y"),
                (new DateTime($account->createDate))->format("H:i:s d/m/Y"),
                (new DateTime($account->lastUpdateDate))->format("H:i:s d/m/Y")
            ]);
        }
        $response = json_encode([
            'draw' => $this->request->get('draw') ? intval($this->request->get('draw')) : 0,
            'recordsTotal' => count($accounts),
            'recordsFiltered' => count($accounts),
            'data' => $resultSet
        ]);
        echo $response;
    }

    public function addAction()
    {
        $username = $this->request->getPost('username');
        $password = $this->request->getPost('password');
        $email = $this->request->getPost('email');
        $fullname = $this->request->getPost('fullname');
        $gender = $this->request->getPost('gender');
        $departmentId = $this->request->getPost('departmentId');
        $birthday = $this->request->getPost('birthday');

        if (!isset($username, $password, $email, $fullname, $gender, $departmentId, $birthday)) {
            echo json_encode(['success' => false, 'msg' => 'Please fill in all required fields.']);
        } else if (Account::count(['username = :username: OR email = :email:', 'bind' => ['username' => $username, 'email' => $email]]) >= 1) {
            echo json_encode(['success' => false, 'msg' => 'Username / email is not available.']);
        } else if ($gender != 0 && $gender != 1) {
            echo json_encode(['success' => false, 'msg' => 'Gender is not valid.']);
        } else {
            $department = Department::findFirst($departmentId);
            if(!$department) {
                echo json_encode(['success' => false, 'msg' => 'Department is not valid.']);
            } else {
                $account = new Account();
                $account->username = $username;
                $account->password = $this->security->hash($password);
                $account->email = $email;
                $account->fullname = $fullname;
                $account->gender = $gender;
                $account->departmentId = $department->id;
                $account->birthday = DateTime::createFromFormat("d/m/Y", $birthday)->format("Y-m-d");
                if ($account->save()) {
                    echo json_encode(['success' => true]);
                } else {
                    echo json_encode(['success' => false, 'msg' => 'Can not save account.']);
                }
            }
        }
    }

    public function deleteAction()
    {
        $id = $this->request->getPost('id');
        if (!isset($id)) {
            echo json_encode(['success' => false]);
        } else {
            $account = Account::findFirst(['id = :id:', 'bind' => ['id' => $id]]);
            if (!$account) {
                echo json_encode(['success' => false]);
            } else if (!$account->delete()) {
                echo json_encode(['success' => false]);
            } else {
                echo json_encode(['success' => true]);
            }
        }
    }

    public function editAction()
    {
        $id = $this->request->getPost('id');
        $username = $this->request->getPost('username');
        $password = $this->request->getPost('password');
        $email = $this->request->getPost('email');
        $fullname = $this->request->getPost('fullname');
        $gender = $this->request->getPost('gender');
        $birthday = $this->request->getPost('birthday');

        if (!isset($id, $username, $password, $email, $fullname, $gender, $birthday)) {
            echo json_encode(['success' => false, 'msg' => 'Please fill in all required fields.']);
        } else {
            $account = Account::findFirst(['id = :id:', 'bind' => ['id' => $id]]);
            if (!$account) {
                echo json_encode(['success' => false, 'msg' => 'Account not found']);
            } else {
                $account->username = $username;
                if (!empty($password)) $account->password = $this->security->hash($password);
                $account->email = $email;
                $account->fullname = $fullname;
                $account->gender = $gender;
                $account->birthday = DateTime::createFromFormat("d/m/Y", $birthday)->format("Y-m-d");
                if (!$account->update()) {
                    echo json_encode(['success' => false, 'msg' => 'Can not update account.']);
                } else {
                    echo json_encode(['success' => true]);
                }
            }
        }
    }
}

