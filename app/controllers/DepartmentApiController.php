<?php

class DepartmentApiController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }

    public function loadAction()
    {
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
}

