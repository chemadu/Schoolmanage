package ssm.schoolmanage.tea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.schoolmanage.entity.Post;
import ssm.schoolmanage.entity.Teacher;
import ssm.schoolmanage.tea.mapper.TeacherMapper;
import ssm.schoolmanage.tea.servicedao.TeacherServiceDao;

@Service("teacherService")
public class TeacherService implements TeacherServiceDao{
	
	@Autowired
	private TeacherMapper teacherMapper;
	
	//查询全部职务
	@Override
	public List<Post> AllPost(Teacher teacher) {
		return teacherMapper.AllPost(teacher);
	}
	
	//全部教师
	@Override
	public List<Teacher> AllTeacher() {
		return teacherMapper.AllTeacher();
	}

	@Override
	public int insertTeacher(Teacher teacher) {
		return teacherMapper.addTeacher(teacher);
	}

	@Override
	public int updateTeacher(Teacher teacher) {
		
		return teacherMapper.updateTeacher(teacher);
	}



}
