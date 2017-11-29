<div class="list-group">
	<ul id="sideManu" class="nav  nav-tabs nav-stacked">
		<c:forEach items="${categories}" var="category">
			<li><a
				href="${contextRoot}/show/category/${category.id}/products"
				class="list-group-item" id="a_${category.name}">${category.name}</a>
				</li>
		</c:forEach>
	</ul>
</div>