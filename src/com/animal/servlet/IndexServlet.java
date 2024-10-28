package com.animal.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.animal.entity.AdminUser;
import com.animal.entity.Animal;
import com.animal.entity.AnimalRecord;
import com.animal.entity.AnimalZr;
import com.animal.entity.LoveUser;
import com.animal.service.AdminUserService;
import com.animal.service.impl.AdminUserServiceImpl;

/**
 * 处理网站的请求
 */
/*@WebServlet("/IndexServlet")*/
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminUserService service = new AdminUserServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");//接受请求的参数
	   /* if(request.getSession().getAttribute("user") == null 
	    		&& request.getSession().getAttribute("loveUser") == null
	    		&& !action.equals("login") && !action.equals("toRegsite")
	    		&& !action.equals("registe")){
			toLogin(request, response);
			return;
	    }*/ if(action != null && action.equals("AnimalListAct")) {
			  AnimalList(request, response);
		}else if(action != null && action.equals("animalListRecord")) {
			animalListRecord(request, response);
	    }else if(action != null && action.equals("zrAnimal")) {
	    	zrAnimal(request, response);
	    }else if(action != null && action.equals("MineZrAnimal")) {
	    	MineZrAnimal(request, response);
	    }else if(action != null && action.equals("zrApply")) {
	    	zrApply(request, response);
	    }else if(action != null && action.equals("animalListLike")) {
	    	animalListLike(request, response);
	}
	    
}
	
	private void zrApply(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String flag = request.getSession().getAttribute("flag").toString();
			LoveUser loveUser =new LoveUser();
			AdminUser adminUser =new AdminUser();
			List<AnimalZr> list = new ArrayList<>();
			if(flag.equals("1")){
				 list= service.selectAnimalZrList(0);
			}else{
				loveUser =  (LoveUser)request.getSession().getAttribute("loveUser");
				Integer id = loveUser.getId();
			    list= service.selectAnimalZrList(id);
			}
            request.setAttribute("list" ,list);
            request.getRequestDispatcher("/wdsh.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void MineZrAnimal(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String id = "";
			String flag = request.getSession().getAttribute("flag").toString();
			if(flag.equals("2")){
				LoveUser user =(LoveUser)request.getSession().getAttribute("loveUser");
				id = user.getId().toString();
			}
            List<AnimalRecord> recordList=service.selectAnimalRecordList(id);
            request.removeAttribute("msg");
            request.setAttribute("recordList" ,recordList);
            request.getRequestDispatcher("/wyzr.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void zrAnimal(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String id = "";
			String flag = request.getSession().getAttribute("flag").toString();
			if(flag.equals("2")){
				LoveUser user =(LoveUser)request.getSession().getAttribute("loveUser");
				id = user.getId().toString();
			}
            List<AnimalRecord> recordList=service.selectAnimalRecordList(id);
            request.removeAttribute("msg");
            request.setAttribute("recordList" ,recordList);
            request.getRequestDispatcher("/zrxx.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void animalListRecord(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String id = "";
			String flag = request.getSession().getAttribute("flag").toString();
			if(flag.equals("2")){
				LoveUser user =(LoveUser)request.getSession().getAttribute("loveUser");
				id = user.getId().toString();
			}
            List<AnimalRecord> recordList=service.selectAnimalRecordList(id);
            request.removeAttribute("msg");
            request.setAttribute("recordList" ,recordList);
            request.getRequestDispatcher("/syjl.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void toLogin(HttpServletRequest request,
			HttpServletResponse response) {
		 try {
				request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		   	return;		
	}

	//首页的动物列表
	private void AnimalList(HttpServletRequest request, HttpServletResponse response) {
	
				
			   String p=request.getParameter("p");//接收页码
		        //System.out.println(p);
		        int pageSize=4;//每页显示5条
		        int pageNum=1; //默认第一页
		        if(p!=null){
		            pageNum= Integer.parseInt(p);
		        }
		        //调用分页查询
		        List<Animal> list=service.getAnimalPage(pageNum,pageSize);
		        //携带参数到页面
		       // request.setAttribute("userList",bList); //绑定参数
		        int nums=service.queryAnimalCount(); //查询总数
		        //计算总页数
		        int totalPage=(nums%pageSize==0)? (nums/pageSize):(nums/pageSize+1);
		        request.setAttribute("cp",pageNum); //当前页
		        request.setAttribute("tp",totalPage); //总页数
			try {
	    		
	        
	            request.removeAttribute("msg");
	            request.setAttribute("list" ,list);
	            request.getRequestDispatcher("/shouye.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
	}
	
	/**
	 * 动物模糊查询
	 * @param request
	 * @param response
	 */
	private void animalListLike(HttpServletRequest request,
			HttpServletResponse response) {
		try {
 		 String name = request.getParameter("animalName");
         List<Animal> list=service.selectAnimalList(name);
         request.removeAttribute("msg");
         request.setAttribute("list" ,list);
         request.getRequestDispatcher("/shouye.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}