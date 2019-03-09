<?php

$router = $di->getRouter();

// Define your routes here
$router->add('/api/account/:action/:params',
    [
        'controller' => 'AccountApi',
        'action' => 1,
        'params' => 2
    ]);

$router->add('/api/department/:action/:params',
    [
        'controller' => 'DepartmentApi',
        'action' => 1,
        'params' => 2
    ]);

$router->handle();
