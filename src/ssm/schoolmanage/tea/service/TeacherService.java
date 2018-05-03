package ssm.schoolmanage.tea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.schoolmanage.entity.Teacher;
import ssm.schoolmanage.tea.mapper.TeacherMapper;
import ssm.schoolmanage.tea.servicedao.TeacherServiceDao;

@Service("teacherService")
public class TeacherService implements TeacherServiceDao{
	
	@Autowired
	private TeacherMapper teacherMapper;
	
	//全部教师
	@Override
	public List<Teacher> AllTeacher() {
		return teacherMapper.AllTeacher();
	}

}
