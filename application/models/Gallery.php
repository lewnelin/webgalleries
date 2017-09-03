<?php

/**
 * Created by PhpStorm.
 * User: Arthur
 * Date: 02/09/2017
 * Time: 16:15
 */
class Gallery extends CI_Model
{
    public $id;
    public $dsName;
    public $dsLocation;
    public $dtBegin;
    public $dtEnd;

    /**
     * Gallery constructor.
     * @param $dsName
     * @param $dsLocation
     * @param $dtBegin
     * @param $dtEnd
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getDsName()
    {
        return $this->dsName;
    }

    /**
     * @param mixed $dsName
     */
    public function setDsName($dsName)
    {
        $this->dsName = $dsName;
    }

    /**
     * @return mixed
     */
    public function getDsLocation()
    {
        return $this->dsLocation;
    }

    /**
     * @param mixed $dsLocation
     */
    public function setDsLocation($dsLocation)
    {
        $this->dsLocation = $dsLocation;
    }

    /**
     * @return mixed
     */
    public function getDtBegin()
    {
        return $this->dtBegin;
    }

    /**
     * @param mixed $dtBegin
     */
    public function setDtBegin($dtBegin)
    {
        $this->dtBegin = $dtBegin;
    }

    /**
     * @return mixed
     */
    public function getDtEnd()
    {
        return $this->dtEnd;
    }

    /**
     * @param mixed $dtEnd
     */
    public function setDtEnd($dtEnd)
    {
        $this->dtEnd = $dtEnd;
    }

    public function insert()
    {
        $this->dsName    = $_POST['dsName'];
        $this->dsLocation    = $_POST['dsLocation'];
        $this->dtBegin    = date('Y-m-d',$_POST['dtBegin']);
        $this->dtEnd    = date('Y-m-d',$_POST['dtEnd']);

        $this->db->insert('gallery', $this);
    }

    public function update()
    {
        $this->dsName    = $_POST['dsName'];
        $this->dsLocation    = $_POST['dsLocation'];
        $this->dtBegin    = date('Y-m-d',$_POST['dtBegin']);
        $this->dtEnd    = date('Y-m-d',$_POST['dtEnd']);

        $this->db->update('gallery', $this, array('id' => $_POST['id']));
    }

    public function findAll()
    {
        $query = $this->db->get('gallery');
        return $query->result();
    }

}