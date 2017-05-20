<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content">
	<div class="container-fluid">
		<div class="row">


			<div class="col-md-8 col-md-offset-2">
				<div class="card">
					<div class="card-header text-center" data-background-color="red">
						<h4 class="title">
							<c:if test="${ not empty param['Error'] }">
								<h3>
									<label style="color: green;">You Are Enter Wrong Password</label>
								</h3>
							</c:if>
							Change Your Password
						</h4>
						<p class="category">Are you want to change Password Must at
							least 3 character's.</p>
					</div>
					<form method="POST" action="Process?action=ChangePassword">
						<div class="card-content">

							<div class="col-sm-3">
								<div class="form-group">
									<label>Current Password <small>(required)</small></label> <input
										name="currpass" type="text" class="form-control"
										placeholder="current password">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>New Password <small>(required)</small></label> <input
										name="newpass" type="password" id="password"
										class="form-control" placeholder="*********">
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<label>Confirm Password<small>(required)</small></label> <input
										name="confpass" type="password" id="confirm_password"
										class="form-control" placeholder="*********">
								</div>
							</div>

							<span id='message'></span>

							<div class="col-sm-3">
								<div class="form-group">
									<input type='submit'
										class='btn btn-finish btn-fill btn-warning btn-wd btn-sm'
										value='Change' onclick="validatePassword();" />
								</div>
							</div>


						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
