package ssm.schoolmanage.tea.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.schoolmanage.entity.Modular;
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
	//查询全部教师
	@RequestMapping("/AllTeacherController.action")
	//转换为json格式
	@ResponseBody
	public List<Teacher> AllTeacherController() {
		return teacherService.AllTeacher();
	}
	
	

}
