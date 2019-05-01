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
