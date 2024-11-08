<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class M_user extends CI_Model {
		public function getData($data = null)
		{
			$this->db->select('*');
			$this->db->from('global.global_user a');
			$this->db->join('global.global_role b', 'b.role_id = a.id_role', 'left');
			$this->db->join('global.global_departemen c', 'c.departemen_id = a.id_departemen', 'left');
			if (isset($data['id'])) $this->db->where('user_id', $data['id']);
			if (isset($data['id_departemen'])) $this->db->where("id_departemen LIKE '".$data['id_departemen']."%'");
			if (isset($data['id_role'])) $this->db->where('id_role', $data['id_role']);
			$this->db->order_by('user_nama_lengkap', 'asc');
			$sql = $this->db->get();

			return (isset($data['id'])) ? $sql->row_array() : $sql->result_array();
		}

		public function addData($data = null)
		{
			$this->db->insert('global.global_user', $data);
	    return $this->db->affected_rows();
		}

		public function updateData($data = null, $id = null)
		{
			$this->db->where('user_id', $id);
	    $this->db->update('global.global_user', $data);
	    return $this->db->affected_rows();
		}

		public function deleteData($id = null)
		{
			$this->db->where('user_id', $id);
	    $this->db->delete('global.global_user');
		}

		public function login($data)
		{
			$this->db->select('*');
			$this->db->from('global.global_user a');
			$this->db->join('global.global_role b', 'b.role_id = a.id_role', 'left');
			$this->db->join('global.global_departemen c', 'c.departemen_id = a.id_departemen', 'left');
			$this->db->where('user_username', $data['username']);
			$this->db->where('user_password', md5($data['password']));
			$this->db->order_by('user_id', 'asc');
			$sql = $this->db->get();

			return $sql->row_array();
		}

		public function getRoles() {
			$this->db->select('*');
			$this->db->from('global.global_role');
			$this->db->order_by('role_nama', 'ASC');
			$query = $this->db->get();
			return $query->result_array();
		}    
	}