package ssm.schoolmanage.tea.servicedao;

import java.util.List;

import ssm.schoolmanage.entity.Post;

public interface PostMapperServiceDao {
	List<Post> getAllPost();
	int addPost(Post p);
	int updatePost(Post p);
	int delPost(int id);
}
