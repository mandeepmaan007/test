<div class="page-content">
    	<div class="row">
		  <div class="col-md-2">
		  	<?php $this->load->view('includes/leftbar'); ?>
		  </div>
		  <div class="col-md-10">

  			<!--<div class="content-box-large">-->
			<div class="panel panel-default" id="headings">
                            <div class="panel-heading"><h3>Study Types</h3></div>
				<nav class="navbar navbar-dark stylish-color">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
                                                        <?php echo ucfirst($this->uri->segment(1));?>
                        </li>
						<li class="breadcrumb-item active"><?php echo ucfirst($this->uri->segment(2));?></li>
					</ol>
				</nav>
				

				<!-- Add Button -->
				<a  href="<?php echo site_url("data").'/'.$this->uri->segment(2); ?>/add" class="btn btn-primary btn-sm" style="margin-left:15px;">Add Study Type</a>
				
				
				<!-- START Main Content -->
  				<div class="panel-body">
				
					<!-- Flash Message -->
                    <legend>
						<?php if($this->session->flashdata('success') === TRUE) { ?>
						<div class="alert alert-success"><a class="close" data-dismiss="alert">x</a><?php echo $this->session->flashdata('msg');?></div>
						<?php } ?>
										
						<?php if($this->session->flashdata('success') === FALSE) { ?>
						<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a><?php echo $this->session->flashdata('msg');?></div>
						<?php } ?>
                    </legend>

                       
					
					<!-- table -->
                    <table class="table table-striped table-bordered" id="example" name="medical_conditions_list">
						<thead>
							<tr>
								<th>Study Type</th>
                                                                <th>Edit</th>
								<th>Delete</th>
                                                        </tr>
                                                </thead>
                        
						<tbody>
						<?php 	foreach ($records as $row)
								{
									echo '<tr>';
									echo '<td>'.$row['study_type'].'</td>';
									echo '<td><a href="'.site_url("data").'/studytypes/update/'.$row['id'].'" style="color:#428bca;"><span class="glyphicon glyphicon-edit"></span></a></td>';  
									echo '<td><a href="'.site_url("data").'/studytypes/delete/'.$row['id'].'" class="delete" style="color:#428bca;"><span class="glyphicon glyphicon-minus-sign"></span></a></td>';  
									
									echo '</tr>';
								}
						?>
                         </tbody>
                    </table>
                                    
  				</div>
				
  			</div>

		  </div>
		</div>
    </div>