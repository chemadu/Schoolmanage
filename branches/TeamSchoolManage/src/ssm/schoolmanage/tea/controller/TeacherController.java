package ssm.schoolmanage.tea.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.schoolmanage.entity.Modular;
import ssm.schoolmanage.entity.Post;
import ssm.schoolmanage.entity.Teacher;
import ssm.schoolmanage.tea.servicedao.TeacherModularServiceDao;
import ssm.schoolmanage.tea.servicedao.TeacherServiceDao;
import ssm.schoolmanage.util.Result;

@Controller
public class TeacherController {

	@Autowired
	private TeacherModularServiceDao modularService;
	
	@Autowired
	private TeacherServiceDao teacherService;
	//全部的模块
	@RequestMapping("/AllController.action")
	//转换为json格式
	@ResponseBody
	public List<Modular> AllController() {
		return modularService.AllModular();
	}
	
	@RequestMapping("/AllPostController.action")
	@ResponseBody
	public List<Post> AllPostController(){
		return teacherService.AllPost();
	}
	
	//查询全部教师
	@RequestMapping("/AllTeacherController.action")
	//转换为json格式
	@ResponseBody
	public List<Teacher> AllTeacherController() {
		return teacherService.AllTeacher();
	}
	//添加教师
	@RequestMapping("/InsertTeacherController.action")
	@ResponseBody
	public int insertTeacher(Teacher teacher){
		int n = teacherService.insertTeacher(teacher);
		if (n>0) {
			Result.toClient(true, "添加成功");
		}else{
			Result.toClient(false, "添加失败");
		}
		return n;
	}
	//修改教师信息
	@RequestMapping("/UpdateTeacherController.action")
	@ResponseBody
	public int updateTeacher(Teacher teacher){
		int n = teacherService.updateTeacher(teacher);
		if (n>0) {
			Result.toClient(true, "修改成功");
		}else {
			Result.toClient(false, "修改失败");
		}
		return n;
	}

}
