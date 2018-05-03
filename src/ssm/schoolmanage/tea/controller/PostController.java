package ssm.schoolmanage.tea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ssm.schoolmanage.entity.Post;
import ssm.schoolmanage.tea.servicedao.PostMapperServiceDao;
import ssm.schoolmanage.util.Result;
@Controller
public class PostController {
	@Autowired
	private PostMapperServiceDao postMapperServiceDao;
	@RequestMapping("/AllPost.action")
	public List<Post> getAllPost() {
		return postMapperServiceDao.getAllPost();
	}
	@RequestMapping("/AddPost.action")
	public int addPost(Post p) {
		int n=postMapperServiceDao.addPost(p);
		if(n>0){
			Result.toClient(true, "成功");
		}else {
			Result.toClient(false, "失败");
		}
		return n;
	}
	@RequestMapping("/UpdatePost.action")
	public int updatePost(Post p) {
		int n=postMapperServiceDao.updatePost(p);
		if(n>0){
			Result.toClient(true, "成功");
		}else {
			Result.toClient(false, "失败");
		}
		return n;
	}
	
}
