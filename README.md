Learing from https://github.com/in28minutes/spring-boot-master-class/tree/master/02.Spring-Boot-Web-Application

Step 01 : 
Goto -> https://start.spring.io/ -> Maven Project -> Java -> 2.1.4 -> Group [com.rezatrue] -> Artifact [spring-boot-wen-application] -> Packaging [Jar] -> Java Version [8] -> Dependencies : Web[Web], DevTools[Core] -> Download zip file & unzip
 
Open Eclipse(STS 4) -> File -> Exisitng Maven Project -> Next -> [select unzip folder] -> finish


Step 02 : Controller 

@ResponseBody : for dispaly text / Json ...

application.properties -> logging.level.org.springframework.web=DEBUG : to show console notification for springframework

Step 04 : 

go to -> application.properties -> add ->
spring.mvc.view.prefix=/WEB-INF/jsp 
spring.mvc.view.suffix=.jsp

create file -> src/main/webapp/WEB-INF/jsp/login.jsp

add to pom.xml ->

<dependency>
	<groupId>org.apache.tomcat.embed</groupId>
	<artifactId>tomcat-embed-jasper</artifactId>
	<scope>provided</scope>
</dependency>


Step 05 : sending request param to view

public String Login(@RequestParam String name, ModelMap model) {
		model.put("name", name);
	
in view (jsp):-> ${name}	

Step 07 : Get & Post 

@RequestMapping(value = "/login", method = RequestMethod.GET)
@RequestMapping(value = "/login", method = RequestMethod.POST)

Step 08 : Dependency injection

@Component
public class LoginService {
.............

@Autowired
LoginService loginService; 

Step 12 : Session

@Controller
@SessionAttributes("name")
public class TodoController
.........

Step 13 & 14 : JSTL

<dependency>
	<groupId>javax.servlet</groupId>
	<artifactId>jstl</artifactId>
</dependency>

......

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
.....

<c:forEach items="${todos}" var="item" varStatus="loop">
	<tr>
		<td>${loop.index}</td>
		<td>${item.desc}</td>
		<td>${item.targetDate}</td>
		<td>${item.done}</td>
	</tr>
</c:forEach>
.....

Step 15 : Bootstrap

<dependency>
	<groupId>org.webjars</groupId>
	<artifactId>bootstrap</artifactId>
	<version>3.3.6</version>
</dependency>
<dependency>
	<groupId>org.webjars</groupId>
	<artifactId>jquery</artifactId>
	<version>1.9.1</version>
</dependency>


<html>
	<head>
		......................
		<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="container">
		
		..........................
		<table class="table  table-striped">
		
		
		..........................
		
		<div ><a ............. class="button">........</a></div>
		
		.......................
		</div>
		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	    <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		
	</body>	

Step 16 : Delete button

	<a href="/delete-todo?id=${item.id}">....</a>

	@RequestMapping(value = "/delete-todo", method = RequestMethod.GET)
	public String deleteTodo(@RequestParam int id) {
		service.deleteTodo(id);
		return "redirect:/list-todos";
	}
	
	
Step 17 : HTML5 form validation

		<form method="POST">
			<fieldset class="form-group">
					<label>Description</label>
					<input type="text" name="desc" class="form-control"  required="required"/>
			</fieldset>
			
			<button type="submit" class="btn btn-success" >add</button>
		</form>
		
Step 18 : Hibernate Validator - Using modelAttribute 

		public class Todo {
			...........
			@Size(min=10, message="Enter at least 10 Characters...")
			private String desc;
			...........
	

		@RequestMapping(value = "/add-todo", method = RequestMethod.POST)
			public String addTodo(ModelMap model, @Valid Todo todo, BindingResult result  ) {
				
				if(result.hasErrors()) {
					return "todo";
				}
				service.addTodo((String)model.get("name"), todo.getDesc(), new Date(), false);
				return "redirect:/list-todos";
			}
	
	
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
		<html>
		.......

		<form:form method="post" modelAttribute="todo">
			<fieldset class="form-group">
				<form:label path="desc" >Description</form:label>
				<form:input path="desc" type="text" class="form-control" required="required"/>
				<form:errors path="desc" cssClass="text-warning" />
			</fieldset>
			<button type="submit" class="btn btn-success" >add</button>
		</form:form>

................................
install "Eclipse Java EE Developer Tools 3.13" plugin for JSP pages
install "DevStyle" plugin only change view
................................
		
		
Step 19 : Updating Todo


	@RequestMapping(value = "/update-todo", method = RequestMethod.POST)
	public String updateTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
		
		if(result.hasErrors()) {
			return "todo";
		}
		todo.setUser((String) model.get("name"));
		service.updateTodo(todo);
		return "redirect:/list-todos";
	}

	public void updateTodo(Todo todo) {
    	todos.remove(todo);
    	todos.add(todo);
    }
	
	
	// optional <form:hidden path="id"/>
	
Step 20 : Handle Date with initBinder 

	@InitBinder
	public void initDataBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	....
	service.addTodo((String)model.get("name"), todo.getDesc(), todo.getTargetDate(), false);
	...
	
	<fieldset class="form-group">
		<form:label path="targetDate" >Target Date</form:label>
		<form:input path="targetDate" type="text" class="form-control" required="required"/>
		<form:errors path="targetDate" cssClass="text-warning" />
	</fieldset>
	
	
	<dependency>
		<groupId>org.webjars</groupId>
		<artifactId>bootstrap-datepicker</artifactId>
		<version>1.0.1</version>
	</dependency>
	
	<script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
	<script>
		$('#targetDate').datepicker({
			format : 'dd/mm/yyyy'
		});	
	</script>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
	<html>
	........
	<td><fmt:formatDate value="${item.targetDate}" pattern="dd/MM/yyyy" /></td>
	
	
Step 21 : JSP Fragments

	<%@ include file="common/header.jspf" %>
	<%@ include file="common/navigation.jspf" %>

	<div class="container">
		<h1>Welcome ${name}</h1>
		<p>Click here to view your <a href="/list-todos">Todo List</a></p>
	</div>

	<%@ include file="common/footer.jspf" %>
	
Step 22 :  Preparing for Spring Security
Step 23 :  Initial Spring Security Setup

		@Configuration
	public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
		@Autowired
		public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
			auth.inMemoryAuthentication().withUser("ali").password("{noop}123").roles("USER", "ADMIN");
		}
		
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.authorizeRequests().antMatchers("/login").permitAll()
					.antMatchers("/", "/*todo*/**").access("hasRole('USER')").and()
					.formLogin();
		}

	}