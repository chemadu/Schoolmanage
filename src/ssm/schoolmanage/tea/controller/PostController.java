package ssm.schoolmanage.tea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.schoolmanage.entity.Post;
import ssm.schoolmanage.tea.servicedao.PostMapperServiceDao;
import ssm.schoolmanage.util.Result;
@Controller
public class PostController {
	@Autowired
	private PostMapperServiceDao postService;
	
	
	
	@RequestMapping("/AllPost.action")
	@ResponseBody
	public List<Post> getAllPost() {
		
		return postService.getAllPost();
	}
	@RequestMapping("/AddPost.action")
	@ResponseBody
	public Result addPost(Post p) {
		int n=postService.addPost(p);
		if(n>0){
			return Result.toClient(true, "成功");
		}else {
			return Result.toClient(false, "失败");
		}
		 
	}
	@RequestMapping("/UpdatePost.action")
	@ResponseBody
	public Result updatePost(Post p) {
		int n=postService.updatePost(p);
		if(n>0){
			return Result.toClient(true, "成功");
		}else {
			return Result.toClient(false, "失败");
		}
	}
	
}
