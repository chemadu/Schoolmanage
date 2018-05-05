package ssm.schoolmanage.tea.mapper;

import java.util.List;


import ssm.schoolmanage.entity.Post;
import ssm.schoolmanage.entity.Teacher;

public interface TeacherMapper {
	/**
	 * 查询全部职务
	 * @return
	 */
	List<Post> AllPost(Teacher teacher);
	/**
	 * 查询全部教师
	 * @return
	 */
	List<Teacher> AllTeacher();
	/**
	 * 添加教师信息
	 * @return
	 */
	int addTeacher(Teacher teacher);
	/**
	 * 修改教师信息
	 * @param teacher
	 * @return
	 */
	int updateTeacher(Teacher teacher);
}
