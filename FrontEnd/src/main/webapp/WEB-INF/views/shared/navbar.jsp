
<div id="logoArea" class="navbar">
	<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
		class="btn btn-navbar"> <span class="icon-bar"></span> <span
		class="icon-bar"></span> <span class="icon-bar"></span>
	</a>
	<div class="navbar-inner">
		<a class="brand" href="${contextRoot}/home"><img
			src="${images}/logo.png" alt="Online Shopping" /></a>
		<form class="form-inline navbar-search" method="post"
			action="products.html">
			<input id="srchFld" class="srchTxt" type="text" /> <select
				class="srchTxt">
				<option>All</option>
				<option>CLOTHES </option>
				<option>FOOD AND BEVERAGES </option>
				<option>HEALTH & BEAUTY </option>
				<option>SPORTS & LEISURE </option>
				<option>BOOKS & ENTERTAINMENTS </option>
			</select>
			<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
		</form>
		<ul id="topMenu" class="nav pull-right">
			<li id="about" class=""><a href="${contextRoot}/about">About</a></li>
			<li id="contact" class=""><a href="${contextRoot}/contact">Contact</a></li>
			<li id="listProducts" class=""><a
				href="${contextRoot}/show/all/products">View Products</a></li>
			<security:authorize access="hasAuthority('ADMIN')">
			<li id="manageProducts" class=""><a
				href="${contextRoot}/manage/products">Manage Products</a></li>
				</security:authorize>
			<li class=""><a href="#login" role="button" data-toggle="modal"
				style="padding-right: 0"><span class="btn btn-large btn-success">Login</span></a>
				<div id="login" class="modal hide fade in" tabindex="-1"
					role="dialog" aria-labelledby="login" aria-hidden="false">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">�</button>
						<h3>Login Block</h3>
					</div>
					<div class="modal-body">
						<form class="form-horizontal loginFrm">
							<div class="control-group">
								<input type="text" id="inputEmail" placeholder="Email">
							</div>
							<div class="control-group">
								<input type="password" id="inputPassword" placeholder="Password">
							</div>
							<div class="control-group">
								<label class="checkbox"> <input type="checkbox">
									Remember me
								</label>
							</div>
						</form>
						<button type="submit" class="btn btn-success">Sign in</button>
						<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					</div>
				</div></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
		<security:authorize access="isAnonymous()">
		<li id="register" class=""><a
				href="${contextRoot}/register">Sign Up</a></li>
				<li id="login" class=""><a
				href="${contextRoot}/login">Login</a></li>
</security:authorize>

		</ul>
	</div>
</div>
<script>

window.userRole = '${userModel.role}';

</script>