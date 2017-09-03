<?php
/**
 * Created by PhpStorm.
 * User: Arthur
 * Date: 02/09/2017
 * Time: 11:35
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('gallery');
    }

    public function view($page = 'home')
    {
        if ( ! file_exists(APPPATH.'views/pages/'.$page.'.php'))
        {
            // Whoops, we don't have a page for that!
            show_404();
        }

        $data['title'] = ucfirst($page); // Capitalize the first letter

        //Bloco para povoar o banco de dados
        $gallery = new Gallery();
        $data['galleries'] = $gallery->findAll();

        $this->load->view('templates/header', $data);
        $this->load->view('pages/'.$page, $data);
        $this->load->view('templates/footer', $data);
    }

}