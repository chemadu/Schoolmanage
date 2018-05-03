package ssm.schoolmanage.tea.servicedao;

import java.util.List;


import ssm.schoolmanage.entity.Teacher;

public interface TeacherServiceDao {
	/**
	 * 查询全部教师
	 * @return
	 */
	List<Teacher> AllTeacher();
}
