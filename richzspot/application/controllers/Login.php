<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Login extends CI_Controller {
	
		public function __construct()
		{
			parent::__construct();

		$this->load->model('M_user');
		}

		public function index()
		{
			$this->load->view('login/login');
		}

		public function masuk()
		{
			$param = array();
			$param['username'] = $this->input->post('username');
			$param['password'] = $this->input->post('password');
			
			$data = $this->M_user->login($param);

			if ($data) {
				$this->session->set_userdata($data);
				redirect(base_url('dashboard'));
			} else {
				$this->session->set_flashdata('pesan', 'Username dan password Salah');
				redirect(base_url('login'));
			}
		}

		public function keluar()
		{
			$this->session->sess_destroy();
			redirect('login');
		}

		public function login()
		{
			$param = array();
			$param['username'] = $this->input->post('username');
			$param['password'] = $this->input->post('password');
			
			$data = $this->M_user->login($param);

			$isi = ($data) ? $data : '0';

			echo json_encode($isi);
		}
	}