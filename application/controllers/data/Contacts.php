<?php
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
         
       $this->load->model('data/Contacts_model');

    }
    
    
    /**
    * Load the main view with all the current model model's data.
    * @return void
    */
    public function index()
    {
        //pagination settings
        $config['per_page'] = 200;
        $config['base_url'] = base_url().'data/contacts';
        $config['use_page_numbers'] = TRUE;
        $config['num_links'] = 20;
        $config['full_tag_open'] = '<ul>';
        $config['full_tag_close'] = '</ul>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a>';
        $config['cur_tag_close'] = '</a></li>';
        
        //limit end
        $page = $this->uri->segment(3);

        //math to get the initial record to be select in the database
        $limit_end = ($page * $config['per_page']) - $config['per_page'];
        if ($limit_end < 0){
            $limit_end = 0;
        } 
        $order_type = 'Asc';
        
	
		$data['count_records']= $this->Contacts_model->count_records();
		$data['records'] = $this->Contacts_model->get_records( '','', $order_type, $config['per_page'],$limit_end);        
		$config['total_rows'] = $data['count_records'];

            
        //initializate the panination helper 
        $this->pagination->initialize($config);         
        
		
		//load the view
        $data['main_content'] = 'data/contacts/list';
        $this->load->view('includes/template', $data);  

    }//index
	
	
	
    public function add()
    {
        
       
		//If save button was clicked, get the data sent via post
        if ($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            
            //form validation
            $this->form_validation->set_rules('fname', 'First Name', 'required');
            $this->form_validation->set_rules('lname', 'Last Name', 'required');
            $this->form_validation->set_rules('title', 'Title', 'required');
            $this->form_validation->set_rules('email', 'Email', 'required');
            $this->form_validation->set_rules('phone', 'Phone', 'required');
          
            
		
            $this->form_validation->set_error_delimiters('<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            //if the form has passed through the validation
            if ($this->form_validation->run())
            {
                $data_to_store = array(
                            'firstname' => $this->input->post('fname'),
                            'lastname' => $this->input->post('lname'),
                            'title' => $this->input->post('title'),
                            'email' => $this->input->post('email'),
                            'email2' => $this->input->post('alt_email'),
                            'phone' => $this->input->post('phone'),
                            'phone_ext' => $this->input->post('phone_ext'),
                            'phone2' => $this->input->post('alt_phone'),
                            'phone2_ext' => $this->input->post('alt_phone_ext'),
                            'organization' => $this->input->post('organization')
                    );
                
                
				//if the insert has returned true then we show the flash message
                $last_insert_id = $this->Contacts_model->store_record($data_to_store);
                if($last_insert_id>0){  
                    
                    $this->session->set_flashdata('success', TRUE);
                    $this->session->set_flashdata('msg', "Record successfully added.");
                                        
                    redirect('data/contacts/');
                    
                }else{
                    $this->session->set_flashdata('success', FALSE);
                }

            }
       }
                
                
		$data['main_content'] = 'data/contacts/add';
            $this->load->view('includes/template', $data);   
    }       
 
    /**
    * Update item by his id
    * @return void
    */
    public function update()
    {
        
        
    //client id 
        $id = $this->uri->segment(4);
		
        if ($this->input->server('REQUEST_METHOD') === 'POST')
        {
		
		  
            //form validation
            $this->form_validation->set_rules('fname', 'First Name', 'required');
            $this->form_validation->set_rules('lname', 'Last Name', 'required');
            $this->form_validation->set_rules('title', 'Title', 'required');
            $this->form_validation->set_rules('email', 'Email', 'required');
            $this->form_validation->set_rules('phone', 'Phone', 'required');
            
            
		
            $this->form_validation->set_error_delimiters('<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            //if the form has passed through the validation
            if ($this->form_validation->run())
            {
                $data_to_store = array(
                            'firstname' => $this->input->post('fname'),
                            'lastname' => $this->input->post('lname'),
                            'title' => $this->input->post('title'),
                            'email' => $this->input->post('email'),
                            'email2' => $this->input->post('alt_email'),
                            'phone' => $this->input->post('phone'),
                            'phone_ext' => $this->input->post('phone_ext'),
                            'phone2' => $this->input->post('alt_phone'),
                            'phone2_ext' => $this->input->post('alt_phone_ext'),
                            'organization' => $this->input->post('organization')
                    );
                
                //if the insert has returned true then we show the flash message
                if($this->Contacts_model->update_record($id, $data_to_store ) == TRUE){
                    
                    $this->session->set_flashdata('success', TRUE);
                    $this->session->set_flashdata('msg', "Record successfully edited.");
                    redirect('data/contacts/');
                    
                }else{
                    
                   $this->session->set_flashdata('success', FALSE);
                   $this->session->set_flashdata('msg', "ERROR: Record could not be edited.");
                }

            }
       }
       
        //product data 
        $data['record'] = $this->Contacts_model->get_record_by_id($id); 
       
        
        //Load the view
        $data['main_content'] = 'data/contacts/edit';
        $this->load->view('includes/template', $data);               

    }//update
    
    
     /**
    * Delete ethnicity record
    * @return void
    */
    public function delete()
    {
        		
        //ethnicity id 
        $id = $this->uri->segment(4);
		
		//delete
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
		

        redirect('data/contacts');
    }

}