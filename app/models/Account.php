<?php

class Account extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $username;

    /**
     * @var string
     */
    public $email;

    /**
     *
     * @var string
     */
    public $password;

    /**
     *
     * @var string
     */
    public $fullname;

    /**
     *
     * @var integer
     */
    public $gender;

    /**
     *
     * @var DateTime
     */
    public $birthday;

    /**
     *
     * @var DateTime
     */
    public $createDate;

    /**
     *
     * @var DateTime
     */
    public $lastUpdateDate;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("accman");
        $this->setSource("account");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'account';
    }

    /**
     * Called before creating
     */
    public function beforeCreate()
    {
        $this->createDate = date('Y-m-d H:i:s');
        $this->lastUpdateDate = date('Y-m-d H:i:s');
    }

    /**
     * Called before updating
     */
    public function beforeUpdate()
    {
        $this->lastUpdateDate = date('Y-m-d H:i:s');
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Account[]|Account|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Account|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * Find account record by Username
     * @param string $username
     * @return Account|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findByUsername($username)
    {
        return self::find([
            'username = :username:',
            'bind' => [
                'username' => $username
            ]
        ]);
    }

    /**
     * Return gender as text (male / female)
     * @return string
     */
    public function getGenderText()
    {
        return $this->gender == 1 ? "Male" : "Female";
    }
}
