package ssm.schoolmanage.tea.mapper;

import java.util.List;


import ssm.schoolmanage.entity.Teacher;

public interface TeacherMapper {
	/**
	 * 查询全部教师
	 * @return
	 */
	List<Teacher> AllTeacher();
}
