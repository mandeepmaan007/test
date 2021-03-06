<?php
defined('BASEPATH') OR exit('No direct script access allowed');

 /**
 * Contacts Controller Class 
 */
 class Contacts extends CI_Controller {

    /**
    * Responsable for auto load the model
    * @return void
    */
    public function __construct()
    {
    	ob_start(); 
    	parent::__construct();

        //If user is not logged in, redirect them to the login page
    	$userarray = get_object_vars($this->session->userdata('user'));
    	$sess_id = $userarray['user_id'];
    	if(empty($sess_id))
    	{
    		$this->session->set_userdata(array('msg'=>''));
    		redirect('/login', 'location');
    	}

    	$this->load->model('Contacts_model');
    	$this->load->library(array('session','form_validation'));

    }
    
    
    /**
    * Load the main view with all the current model model's data.
    * @return void
    */
    public function index()
    {
    	$config['per_page'] = 200;
    	$config['base_url'] = base_url().'contacts';
    	$config['use_page_numbers'] = TRUE;
    	$config['num_links'] = 20;
    	$config['full_tag_open'] = '<ul>';
    	$config['full_tag_close'] = '</ul>';
    	$config['num_tag_open'] = '<li>';
    	$config['num_tag_close'] = '</li>';
    	$config['cur_tag_open'] = '<li class="active"><a>';
    	$config['cur_tag_close'] = '</a></li>';

    	$page = $this->uri->segment(3);

    	$limit_end = ($page * $config['per_page']) - $config['per_page'];
    	if ($limit_end < 0){
    		$limit_end = 0;
    	} 

    	$order_type = 'Asc';

    	$data['count_records']= $this->Contacts_model->count_records();
    	$data['records'] = $this->Contacts_model->get_records( '','', $order_type, $config['per_page'],$limit_end);        
    	$config['total_rows'] = $data['count_records'];

    	$this->pagination->initialize($config);         

    	$data['main_content'] = 'contacts/list';
    	$this->load->view('includes/template', $data);  

    }


    /**
    * Load update view of Contacts.
    *
    * params $id Contacts table primary key 
    * 
    * @return void
    */

    public function update( $id = 0 )
    {

    	$data['locations'] = $this->Contacts_model->load_data_details( $id );
    	$data['contact_id'] = $id ;      
    	$data['main_content'] = 'contacts/edit';
    	$this->load->view('includes/template', $data);   
    } 

    /**
    *  Updates Contacts edit data
    * 
    * @return void
    */
    public function do_update()
    {
    	$this->Contacts_model->update ();
    }

    /**
    * Delete Contacts record
    * @return void
    */
    public function delete()
    {
    	$id = $_POST['id'];

    	if($this->Contacts_model->delete_record($id))
    	{
    		$this->session->set_flashdata('success', TRUE);
    		$this->session->set_flashdata('msg', "Record successfully deleted.");
    	}
    	else
    	{
    		$this->session->set_flashdata('success', FALSE);
    		$this->session->set_flashdata('msg', "ERROR: Record could not be deleted.");
    	}

    }

}