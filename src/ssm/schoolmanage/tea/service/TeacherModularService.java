package ssm.schoolmanage.tea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.schoolmanage.entity.Modular;
import ssm.schoolmanage.tea.mapper.TeacherModularMapper;
import ssm.schoolmanage.tea.servicedao.TeacherModularServiceDao;

@Service("modularService")
public class TeacherModularService implements TeacherModularServiceDao {

	@Autowired
	private TeacherModularMapper teacherModularMapper;
	
	//全部模块
	@Override
	public List<Modular> AllModular() {
		return teacherModularMapper.AllModular();
	}


}
