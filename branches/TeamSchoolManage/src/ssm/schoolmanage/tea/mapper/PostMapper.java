package ssm.schoolmanage.tea.mapper;

import java.util.List;

import ssm.schoolmanage.entity.Post;

public interface PostMapper {
	List<Post> getAllPost();
	int addPost(Post p);
	int updatePost(Post p);
	int delPost(int id);
}
