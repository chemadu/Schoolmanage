package ssm.schoolmanage.tea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.schoolmanage.entity.Post;
import ssm.schoolmanage.tea.mapper.PostMapper;
import ssm.schoolmanage.tea.servicedao.PostMapperServiceDao;

@Service("postService")
public class PostMapperService implements PostMapperServiceDao {
	@Autowired
	private PostMapper postMapper;

	@Override
	public List<Post> getAllPost() {

		return postMapper.getAllPost();
	}

	@Override
	public int addPost(Post p) {
		return postMapper.addPost(p);
	}

	@Override
	public int updatePost(Post p) {
		return postMapper.addPost(p);
	}

	@Override
	public int delPost(int id) {
		return postMapper.delPost(id);
	}

}
