<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<head>

<title>검색 레시피 페이지</title>
</head>


<body>
	<div class="category">
		<div class="recipeContainer">
			<!-- 글 보여주기 -->
			<div class="recipesCard">
				<c:forEach var="recipe" items="${searchList}">
					<!-- 이안에서 생성해야 같은 id 사용가능 -->
					<div class="card">
						<div class="cardHeader">
							<p style="margin: 0;">작성자 : ${recipe.member_id}</p>
							<p style="margin: 0;">조회수 : ${recipe.viewcnt}</p>
						</div>
						<div class="cardImg"
							style="background-image:url('${contextPath}/download.do?recipe_id=${recipe.recipe_id}&file_path=${recipe.file_path}')"></div>
						<div class="card-body">
							<div class="cardText">
								<h5 class="card-title">${recipe.recipe_name}</h5>
							</div>
							<p class="cardDate">${recipe.create_date}</p>
							<!-- Button trigger modal -->
							<button onclick="viewcnt(${recipe.recipe_id})" type="button"
								class="cardBtn btn btn-primary" id="${recipe.recipe_id}Btn"
								data-bs-toggle="modal"
								data-bs-target="#staticBackdrop${recipe.recipe_id}">상세
								레시피</button>


							<!-- 상세 레시피 모달 -->
							<div class="modal fade" id="staticBackdrop${recipe.recipe_id}"
								data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div
									class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="staticBackdropLabel">${recipe.recipe_name}</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<h4 class="cardH4">재료</h4>
										<div class="card-text">${recipe.recipe_ingredients}</div>
										<h4 class="cardH4">레시피</h4>
										<textarea cols="50" rows="15" class="modal-body recipe_text">${recipe.recipe_text}</textarea>

										<!-- Modal btn -->
										<div class="modal-footer">
											<c:choose>
												<c:when test="${memberID == recipe.member_id}">
													<!-- 수정 모달 버튼 -->
													<button type="button" class="btn btn-primary"
														data-bs-toggle="modal"
														data-bs-target="#editRecipe${recipe.recipe_id}"
														data-bs-whatever="@getbootstrap">수정</button>
													<!-- 수정 모달 버튼 -->
													<!-- 삭제 모달 버튼 -->
													<button type="button" class="btn btn-primary"
														data-bs-toggle="modal"
														data-bs-target="#deleteRecipe${recipe.recipe_id}">삭제</button>
													<!-- 삭제 모달 버튼 -->
												</c:when>
											</c:choose>
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">닫기</button>
										</div>
										<!-- Modal btn -->

									</div>
								</div>
							</div>
							<!-- 상세 레시피 모달 -->


							<!-- 수정 모달 -->
							<form class="modal fade" name="frmRecipe${recipe.recipe_id}"
								action="${contextPath}" id="editRecipe${recipe.recipe_id}"
								tabindex="-1" aria-labelledby="editModalLabel"
								aria-hidden="true" enctype="multipart/form-data" method="post">
								<div
									class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
									<div class="modal-content">
										<input style="display: none" name="recipe_id"
											value="${recipe.recipe_id}" />
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="editModalLabel">${recipe.recipe_name}
												레시피 수정</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="mb-3">
												<label for="dishName" class="col-form-label">레시피
													카테고리</label>
												<div class="checkboxs">
													<c:choose>
														<c:when test="${recipe.recipe_category eq 'koreanFood'}">
															<label>한식<input type="checkbox"
																class="checkedCategory" name="recipe_category"
																value="koreanFood" checked="on"
																onClick="countCheck(this)" /></label>
														</c:when>
														<c:otherwise>
															<label>한식<input type="checkbox"
																class="checkedCategory" name="recipe_category"
																value="koreanFood" onClick="countCheck(this)" /></label>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${recipe.recipe_category eq 'westernFood'}">
															<label>양식<input type="checkbox"
																class="checkedCategory" name="recipe_category"
																value="westernFood" checked="on"
																onClick="countCheck(this)" /></label>
														</c:when>
														<c:otherwise>
															<label>양식<input type="checkbox"
																class="checkedCategory" name="recipe_category"
																value="westernFood" onClick="countCheck(this)" /></label>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${recipe.recipe_category eq 'chineseFood'}">
															<label>중식<input type="checkbox"
																class="checkedCategory" name="recipe_category"
																value="chineseFood" checked="on"
																onClick="countCheck(this)" /></label>
														</c:when>
														<c:otherwise>
															<label>중식<input type="checkbox"
																class="checkedCategory" name="recipe_category"
																value="chineseFood" onClick="countCheck(this)" /></label>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${recipe.recipe_category eq 'japaneseFood'}">
															<label>일식<input type="checkbox"
																class="checkedCategory" name="recipe_category"
																value="japaneseFood" checked="on"
																onClick="countCheck(this)" /></label>
														</c:when>
														<c:otherwise>
															<label>일식<input type="checkbox"
																class="checkedCategory" name="recipe_category"
																value="japaneseFood" onClick="countCheck(this)" /></label>
														</c:otherwise>
													</c:choose>
												</div>

											</div>
											<div class="mb-3">
												<label for="dishName" class="col-form-label">요리 이름:</label>
												<input type="text" required placeholder="요리 이름을 입력해주세요."
													class="form-control" id="editDishName"
													value="${recipe.recipe_name}" name="recipe_name">
											</div>
											<div class="mb-3">
												<label for="material" class="col-form-label">재료:</label>
												<textarea class="form-control" required
													placeholder="요리 재료를 입력해주세요." id="editMaterial"
													name="recipe_ingredients">${recipe.recipe_ingredients}</textarea>
											</div>
											<div class="mb-3">
												<label for="recipeText" class="col-form-label">레시피:</label>
												<textarea class="form-control" required
													placeholder="요리 레시피를 입력해주세요." id="editRecipeText"
													name="recipe_text">${recipe.recipe_text}</textarea>
											</div>
											<div class="mb-3">
												<label for="dishImg" class="col-form-label">요리 이미지:</label>
												<input type="file" placeholder="요리이미지를 첨부해주세요."
													class="form-control" onchange="readURL(this)"
													name="file_path" value="${recipe.file_path}"></input>
											</div>


											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													id="editSaveBtn"
													onClick="modifyRecipe(frmRecipe${recipe.recipe_id})">수정</button>
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal" id="editClose">닫기</button>
											</div>
										</div>

									</div>
								</div>
							</form>
							<!-- 수정 모달 -->

							<!-- 삭제 모달 -->
							<div class="smallModal modal fade"
								id="deleteRecipe${recipe.recipe_id}" data-bs-backdrop="static"
								data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="deleteModalLabel">${recipe.recipe_name}
												레시피 삭제</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">${recipe.recipe_name}레시피를
											삭제하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" id="deleteYes"
												onclick="removeRecipe('${contextPath}/board/removeRecipe.do', ${recipe.recipe_id})">삭제</button>
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal" id="deleteClose">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 삭제 모달 -->
							<!-- 이안에서 생성해야 같은 id 사용가능 -->
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 글 보여주기 -->
		</div>
	</div>

	<script>
    
    
    let recipeArr = [];
    let recipe = {};
 
	<c:forEach var="recipe" items="${searchList}" >     
	recipe = {
    	    recipeId: "${recipe.recipe_id}",
    	    memberId: "${recipe.member_id}",
    	    category: "${recipe.recipe_category}",
    	    material: "${recipe.recipe_ingredients}",
    	    dishName: "${recipe.recipe_name}",
    	    recipeText: "${recipe.recipe_text}",
    	    writeDate: "${recipe.create_date}",
    	    dishImg:
    	    	"${recipe.file_path}"
    	  };
	recipeArr.push(recipe);
	</c:forEach>
    	 
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/js/search.js"></script>
</body>
</html>