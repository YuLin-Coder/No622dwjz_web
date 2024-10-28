package com.animal.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.animal.entity.AdminUser;
import com.animal.entity.Animal;
import com.animal.entity.AnimalRecord;
import com.animal.entity.AnimalZr;
import com.animal.entity.FeedWay;
import com.animal.entity.Hfjl;
import com.animal.entity.LoveUser;
import com.animal.service.AdminUserService;
import com.animal.service.impl.AdminUserServiceImpl;

public class AdminUserServlet extends HttpServlet {
	
	private AdminUserService service = new AdminUserServiceImpl();
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		   String action=request.getParameter("action");//接受请求的参数
		    if(request.getSession().getAttribute("user") == null 
		    		&& request.getSession().getAttribute("loveUser") == null
		    		&& !action.equals("login") && !action.equals("toRegsite")
		    		&& !action.equals("registe")){
				toLogin(request, response);
				return;
		    }else if(action != null && action.equals("login")) {//处理登录
				login(request, response);
			}else if(action != null && action.equals("welcome")) {//跳转到控制台
				welcome(request,response);
			}else if(action != null && action.equals("adminList")){
				adminList(request,response);
			}else if(action != null && action.equals("deleteAdminUser")){
				deleteAdmin(request,response);
			}else if(action != null && action.equals("toRegsite")) {//跳转到注册界面
				toRegsite(request, response);
			}else if(action != null && action.equals("registe")) {//进行注册
				registe(request,response);
			}else if(action != null && action.equals("loveUserList")){
				loveUserList(request,response);
			}else if(action != null && action.equals("deleteLoveUser")){
				deleteLoveUser(request,response);
			}else if(action != null && action.equals("yes")) {
				yes(request,response);
			}else if(action != null && action.equals("no")) {
				no(request,response);
			}else if(action != null && action.equals("LoginOutAct")){//退出登录
				loginOut(request,response);
			}else if(action != null && action.equals("animalList")){
				animalList(request,response);
			}else if(action != null && action.equals("deleteAnimal")){
				deleteAnimal(request,response);
			}else if(action != null && action.equals("toAddAnimal")){
				toAddAnimal(request,response);
			}else if(action != null && action.equals("addAnimal")){
				addAnimal(request,response);
			}else if(action != null && action.equals("ly")){
				lyAnimal(request,response);
			}else if(action != null && action.equals("animalListRecord")){
				animalRecordList(request,response);
			}else if(action != null && action.equals("toAddFeed")){
				toAddFeed(request,response);
			}else if(action != null && action.equals("addFeedWay")){
				addFeedWay(request,response);
			}else if(action != null && action.equals("toFeed")){
				toFeed(request,response);
			}else if(action != null && action.equals("animal_zr")){
				toZr(request,response);
			}else if(action != null && action.equals("zrAnimal")){
				zrAnimal(request,response);
			}else if(action != null && action.equals("zrApply")){
				zrApply(request,response);
			}else if(action != null && action.equals("zrYes")){
				zrYes(request,response);
			}else if(action != null && action.equals("zrNo")){
				zrNo(request,response);
			}else if(action != null && action.equals("hfList")){
				hfList(request,response);
			}else if(action != null && action.equals("addHf")){//新增回访记录页面
				addHf(request,response);
			}else if(action != null && action.equals("addHfjl")){//新增回访记录
				addHfjl(request,response);
			}else if(action != null && action.equals("deleteHfjl")){//删除回访记录
				deleteHfjl(request,response);
			}else if(action != null && action.equals("toEditHfjl")){//去修改回访记录页面
				toEditHfjl(request,response);
			}else if(action != null && action.equals("editHfjl")){//修改回访记录
				editHfjl(request,response);
			}else if(action != null && action.equals("adminListLike")){
				adminListLike(request,response);
			}else if(action != null && action.equals("toEditAdmin")){//去管理员修改页面
				toEditAdmin(request,response);
			}else if(action != null && action.equals("editAdmin")){//管理员修改
				editAdmin(request,response);
			}else if(action != null && action.equals("toEditLoveUser")){//去修改爱心人士页面
				toEditLoveUser(request,response);
			}else if(action != null && action.equals("editLoveUser")){//修改爱心人士
				editLoveUser(request,response);
			}else if(action != null && action.equals("loveListLike")){//爱心人士模糊查询
				loveListLike(request,response);
			}else if(action != null && action.equals("toLogin")){
				toLogin(request,response);
			}else if(action != null && action.equals("toMain")){
				toMain(request,response);
			}else if(action != null && action.equals("animalListLike")){
				animalListLike(request,response);
			}
		    
		}

	private void animalListLike(HttpServletRequest request,
			HttpServletResponse response) {
		try {
    		String name = request.getParameter("userName");
            List<Animal> list=service.selectAnimalList(name);
            request.removeAttribute("msg");
            request.setAttribute("list" ,list);
            request.getRequestDispatcher("/WEB-INF/jsp/animal_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	/**
	 * 爱心人士模糊查询
	 * @param request
	 * @param response
	 */
	private void loveListLike(HttpServletRequest request,
			HttpServletResponse response) {
		try {
	   		  String userName = request.getParameter("userName");
	           List<LoveUser> list=service.likeLoveUserList(userName);
	           request.removeAttribute("msg");
	           request.setAttribute("list" ,list);
	           request.getRequestDispatcher("/WEB-INF/jsp/love_user_list.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

	/**
	 * 修改爱心人士
	 * @param request
	 * @param response
	 */
	private void editLoveUser(HttpServletRequest request,
			HttpServletResponse response) {
		  String userName = request.getParameter("userName");
		  String password = request.getParameter("password");
		  String realName = request.getParameter("realName");
		  String loveId = request.getParameter("loveId");
		  String mail = request.getParameter("mail");
		  String phone = request.getParameter("phone");
		  String address = request.getParameter("address");
		  LoveUser loveUser =new LoveUser();
		  loveUser.setId(Integer.parseInt(loveId));
		  loveUser.setAddress(address);
		  loveUser.setEmail(mail);
		  loveUser.setPassword(password);
		  loveUser.setPhone(phone);
		  loveUser.setRealName(realName);
		  loveUser.setUserName(userName);
		  boolean success = service.editLoveUser(loveUser);
	 		try {
	 			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=loveUserList");
	 		} catch (IOException e) {
	 			e.printStackTrace();
	 		}
		  
	}


	/**
	 * 去修改爱心人士页面
	 * @param request
	 * @param response
	 */
	private void toEditLoveUser(HttpServletRequest request,
			HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
		LoveUser loveUser = service.selectLoveUserById(id);
		request.getSession().setAttribute("loveUser",loveUser);
        try {
            try {
				request.getRequestDispatcher("/WEB-INF/jsp/editLoveUser.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //重定向防止重复提交哦
		
	}


	private void editAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		  String userName = request.getParameter("userName");
		  String password = request.getParameter("password");
		  String realName = request.getParameter("realName");
		  String adminId = request.getParameter("adminId");
		  AdminUser adminUser =new AdminUser();
		  adminUser.setId(Integer.parseInt(adminId));
		  adminUser.setPassword(password);
		  adminUser.setRealName(realName);
		  adminUser.setUserName(userName);
		  boolean success = service.editAdmin(adminUser);
	 		try {
	 			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=adminList");
	 		} catch (IOException e) {
	 			e.printStackTrace();
	 		}

	}


	/**
	 * 管理员修改页面
	 * @param request
	 * @param response
	 */
	private void toEditAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
		AdminUser adminUser = service.selectAdminById(id);
		request.getSession().setAttribute("adminUser",adminUser);
        try {
            try {
				request.getRequestDispatcher("/WEB-INF/jsp/editAdmin.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //重定向防止重复提交哦
		
	}


	/**
	 * 修改回访记录
	 * @param request
	 * @param response
	 */
	private void editHfjl(HttpServletRequest request,
			HttpServletResponse response) {
		String hfz=request.getParameter("hfz");
        String hfTime=request.getParameter("hfTime");
        String animal_state=request.getParameter("animal_state");
		int id=Integer.parseInt(request.getParameter("hfid"));
        Hfjl hfjl = new Hfjl();
        hfjl.setId(id);
        hfjl.setHfz(hfz);
        hfjl.setHfrq(hfTime);
        hfjl.setCondation(animal_state);
        boolean success = service.editHfjl(hfjl);
 		try {
 			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=hfList");
 		} catch (IOException e) {
 			e.printStackTrace();
 		}
	}

	/**
	 *  去修改回访记录页面
	 * @param request
	 * @param response
	 */
	private void toEditHfjl(HttpServletRequest request,
			HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
		Hfjl hfjl = service.selectHfjlById(id);
		request.getSession().setAttribute("hfjl", hfjl);
        try {
            try {
				request.getRequestDispatcher("/WEB-INF/jsp/editHfjl.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //重定向防止重复提交哦
	}

	/**
	 * 删除回访记录
	 * @param request
	 * @param response
	 */
	private void deleteHfjl(HttpServletRequest request,
			HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
	    boolean re = service.deleteHfjl(id);
        try {
			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=hfList");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //重定向防止重复提交哦
		
	}

	/**
	 * 新增回访记录
	 * @param request
	 * @param response
	 */
	private void addHfjl(HttpServletRequest request,
			HttpServletResponse response) {
		String id=request.getParameter("animal_name");
        String hfz=request.getParameter("hfz");
        String hfTime=request.getParameter("hfTime");
        String animal_state=request.getParameter("animal_state");
        Hfjl hfjl =new Hfjl();
        hfjl.setCondation(animal_state);
        hfjl.setHfz(hfz);
        hfjl.setHfrq(hfTime);
        List<AnimalRecord> list = service.selectAnimalRecordList("hfjl");
        for(AnimalRecord aa: list){
        	if(aa.getLyid().equals(id)){
        		hfjl.setAnimal_id(Integer.parseInt(aa.getAnimal_id()));
        		hfjl.setCategory(aa.getType());
                hfjl.setDirector(aa.getRealName());
        		hfjl.setDirector_id(Integer.parseInt(aa.getUser_id()));
        		hfjl.setName(aa.getName());
        		hfjl.setImgUrl(aa.getImgUrl());
        	}
        }
        boolean success = service.addHfjl(hfjl);
 		try {
 			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=hfList");
 		} catch (IOException e) {
 			e.printStackTrace();
 		}
        
        
		
	}

	/**
	 * 新增回访记录页面
	 * @param request
	 * @param response
	 */
	private void addHf(HttpServletRequest request, HttpServletResponse response) {
		try {
	        List<AnimalRecord> list = service.selectAnimalRecordList("hfjl");
			request.getSession().setAttribute("list", list);

			request.getRequestDispatcher("/WEB-INF/jsp/addHfjl.jsp").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	/**
	 * 回访记录列表
	 * @param request
	 * @param response
	 */
	private void hfList(HttpServletRequest request, HttpServletResponse response) {
		  String name=request.getParameter("name");
		  Map<String,Object> map = new HashMap<String,Object>();
		  map.put("name", name);
		  String p=request.getParameter("p");//接收页码
	        //System.out.println(p);
	        int pageSize=4;//每页显示5条
	        int pageNum=1; //默认第一页
	        if(p!=null){
	            pageNum= Integer.parseInt(p);
	        }
	        //调用分页查询
	        List<Hfjl> list=service.getHfjlPage(pageNum,pageSize,map);
	        //携带参数到页面
	       // request.setAttribute("userList",bList); //绑定参数
	        int nums=service.queryHfjlCount(); //查询总数
	        //计算总页数
	        int totalPage=(nums%pageSize==0)? (nums/pageSize):(nums/pageSize+1);
	        request.setAttribute("cp",pageNum); //当前页
	        request.setAttribute("tp",totalPage); //总页数
		try {
          request.removeAttribute("msg");
          request.setAttribute("list" ,list);
          request.getRequestDispatcher("/WEB-INF/jsp/hfjl_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	/**
	 * 转让不同意
	 * @param request
	 * @param response
	 */
	private void zrNo(HttpServletRequest request, HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
		String state=request.getParameter("state");
		String temp=request.getParameter("temp");
	    boolean re = service.zrNo(id,state);
        try {
        	if(temp != null && temp.equals("12")){
    			response.sendRedirect(request.getContextPath()+"/IndexServlet?action=zrApply");
        	}else{
    			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=zrApply");
        	}
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}


	/**
	 * 转让同意
	 * @param request
	 * @param response
	 */
	private void zrYes(HttpServletRequest request, HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
		String temp=request.getParameter("temp");
		String state=request.getParameter("state");
	    boolean re = service.zrYes(id,state);
        try {
        	if(temp != null && temp.equals("12")){
    			response.sendRedirect(request.getContextPath()+"/IndexServlet?action=zrApply");
        	}else{
    			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=zrApply");
        	}
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}


	/**
	 * 转让申请记录
	 * @param request
	 * @param response
	 */
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
            request.getRequestDispatcher("/WEB-INF/jsp/zr_apply_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	/**
	 * 新增转让动物信息
	 * @param request
	 * @param response
	 */
	private void zrAnimal(HttpServletRequest request,
			HttpServletResponse response) {
		String name=request.getParameter("name");
        String animal_id=request.getParameter("animal_id");
        String uer_id=request.getParameter("uer_id");
        String animal_type=request.getParameter("animal_type");
        String before_user_name=request.getParameter("before_user_name");
        String before_user_phone=request.getParameter("before_user_phone");
        String now_user=request.getParameter("now_user");
        String zrDate=request.getParameter("zrDate");
        String zr_ways=request.getParameter("zr_ways");
        String lyid=request.getParameter("lyid");
        String temp =request.getParameter("temp");
        String ano =request.getParameter("ano");
        AnimalZr animalZr = new AnimalZr();
        animalZr.setAno(ano);
        animalZr.setAniaml_name(name);
        animalZr.setAnimal_id(Integer.parseInt(animal_id));
        animalZr.setAnimal_type(animal_type);
        animalZr.setCreateTime(zrDate);
        animalZr.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
        animalZr.setXzr_id(Integer.parseInt(now_user));
        animalZr.setYzr(before_user_name);
        animalZr.setYzr_phone(before_user_phone);
        animalZr.setZr_way(zr_ways);
        animalZr.setYzr_id(Integer.parseInt(uer_id));
        boolean success = service.addAnimalZr(animalZr,lyid);
		try {
			if(temp != null && temp.equals("1")){
				response.sendRedirect(request.getContextPath()+"/IndexServlet?action=zrAnimal");
			}else{
				response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=animalListRecord");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 去转让页面
	 * @param request
	 * @param response
	 */
	private void toZr(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");
		String lyid = request.getParameter("lyid");
		String animal_id = request.getParameter("animal_id");
		String temp = request.getParameter("temp");
		try {
	        LoveUser user = service.selectLoveUserById(user_id);
	        Animal animal = service.selectAnimalById(animal_id);
	        List<LoveUser> userList = service.selectLoveUserList("");
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("animal", animal);
			request.getSession().setAttribute("lyid", lyid);
			request.getSession().setAttribute("userList", userList);
			request.getSession().setAttribute("temp", temp);
			request.getRequestDispatcher("/WEB-INF/jsp/animal_zr.jsp").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 喂养方式展示页面
	 * @param request
	 * @param response
	 */
	private void toFeed(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("animal_id");
		String url = request.getParameter("animal_url");
		try {
			url = new String(url.getBytes("ISO8859_1"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
	        FeedWay way = service.selectFeedWay(id);
			request.getSession().setAttribute("way", way);
			request.getSession().setAttribute("url", url);
			request.getRequestDispatcher("/WEB-INF/jsp/feedDetail.jsp").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 新增喂养方式
	 * @param request
	 * @param response
	 */
	private void addFeedWay(HttpServletRequest request,
			HttpServletResponse response) {
		String name=request.getParameter("name");
        String animal_id=request.getParameter("animal_id");
        String feedWays=request.getParameter("feedWay");
        FeedWay feed = new FeedWay();
        feed.setAnimal_name(name);
        feed.setAnimal_id(Integer.parseInt(animal_id));
        feed.setWyfs(feedWays);
        boolean success = service.addFeedWay(feed);
		try {
			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=animalList");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * 去新增喂养方式界面
	 * @param request
	 * @param response
	 */
	private void toAddFeed(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("animal_id");
		String name = request.getParameter("animal_name");
		String url = request.getParameter("animal_url");
		try {
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("url", url);
			request.getRequestDispatcher("/WEB-INF/jsp/feed.jsp").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 动物领养记录
	 * @param request
	 * @param response
	 */
	private void animalRecordList(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String temp = request.getParameter("temp");
			String id = "";
			String flag = request.getSession().getAttribute("flag").toString();
			if(flag.equals("2")){
				LoveUser user =(LoveUser)request.getSession().getAttribute("loveUser");
				id = user.getId().toString();
			}
            List<AnimalRecord> list=service.selectAnimalRecordList(id);
            request.removeAttribute("msg");
            request.setAttribute("list" ,list);
            request.setAttribute("temp" ,temp);
            request.getRequestDispatcher("/WEB-INF/jsp/animal_record_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	/**
	 * 领养动物
	 * @param request
	 * @param response
	 */
	private void lyAnimal(HttpServletRequest request,
			HttpServletResponse response) {
		int animal_id=Integer.parseInt(request.getParameter("animal_id"));
		int user_id=Integer.parseInt(request.getParameter("user_id"));
		String temp=request.getParameter("temp");
	    boolean re = service.lyAnimal(animal_id,user_id);
        try {
        	if(temp != null && temp.equals("100")){
    			response.sendRedirect(request.getContextPath()+"/IndexServlet?action=animalListRecord");
        	}else{
    			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=animalList");
        	}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //
		
	}


	/**
	 * 新增动物
	 * @param request
	 * @param response
	 */
	private void addAnimal(HttpServletRequest request,
			HttpServletResponse response) {
		/*String name=request.getParameter("name");
        String nickName=request.getParameter("nickName");
        String type=request.getParameter("type");*/
        Animal animal = fileUpload(request);
    	//Animal animal = new Animal();
    	/*animal.setName(name);
    	animal.setType(type);
    	animal.setNickName(nickName);*/
    	animal.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
    	//animal.setImgUrl("/img/dog.jpg");
        boolean success = service.addAnimal(animal);
		try {
			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=animalList");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}
	
	/**
	 * 动物图片上传
	 * @param request
	 * @return
	 */
	private Animal fileUpload(HttpServletRequest request) {
		Animal animal=new Animal();
		try {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> list = upload.parseRequest(request);
		for(FileItem item : list){
			if(item.isFormField()){
				String name = item.getFieldName();
				String value = item.getString("UTF-8");
				BeanUtils.setProperty(animal, name, value);
			}else{
				String filename = item.getName();
				String savefilename = makeFileName(filename);
				//String savepath="G:\\project\\流浪动物救助网站\\dwjz_web\\WebContent\\img\\";
				String savepath= this.getServletContext().getRealPath("/img");//Tomcat虚拟路径
				InputStream in = item.getInputStream();
				FileOutputStream out = new FileOutputStream(savepath + "\\" + savefilename);
				int len = 0;
				byte buffer[] = new byte[1024];
				while((len = in.read(buffer)) > 0){
					out.write(buffer, 0, len);
				}
				in.close();
				out.close();
				item.delete();
				animal.setImgUrl("/img/"+savefilename);
				System.out.println(animal.getImgUrl());
			}
		}
	        return animal;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}
	
	/**
	 * 动物图片重命名 防止图片名称重复
	 * @param filename
	 * @return
	 */
	public String makeFileName(String filename){
		String ext = filename.substring(filename.lastIndexOf(".") + 1);
		return UUID.randomUUID().toString() + "." + ext;
	}


	/**
	 * 去添加动物页面
	 * @param request
	 * @param response
	 */
	private void toAddAnimal(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.getRequestDispatcher("/WEB-INF/jsp/addAnimal.jsp").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	/**
	 * 删除动物信息
	 * @param request
	 * @param response
	 */
	private void deleteAnimal(HttpServletRequest request,
			HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
	    boolean re = service.deleteAnimal(id);
        try {
			response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=animalList");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //重定向防止重复提交哦
	}


	/**
	 * 动物列表展示
	 * @param request
	 * @param response
	 */
	private void animalList(HttpServletRequest request,
			HttpServletResponse response) {
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
    		String name = request.getParameter("userName");
           // List<Animal> list=service.selectAnimalList(name);
            request.removeAttribute("msg");
            request.setAttribute("list" ,list);
            request.getRequestDispatcher("/WEB-INF/jsp/animal_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	/**
	 * 模糊查询
	 * @param request
	 * @param response
	 */
	private void adminListLike(HttpServletRequest request,
			HttpServletResponse response) {
		try {
   		  String userName = request.getParameter("userName");
           List<AdminUser> list=service.selectAdminList(userName);
           request.removeAttribute("msg");
           request.setAttribute("list" ,list);
           request.getRequestDispatcher("/WEB-INF/jsp/admin_user_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	/**
	 * 退出登录
	 * @param request
	 * @param response
	 */
	private void loginOut(HttpServletRequest request,
			HttpServletResponse response) {
		request.getSession().invalidate();
        try {
			response.sendRedirect(request.getContextPath()+"/IndexServlet?action=AnimalListAct");

			//request.getRequestDispatcher("/shouye.jsp").forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	/**
	 * 管理员审核不通过
	 * @param request
	 * @param response
	 */
	private void no(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		  int id=Integer.parseInt(request.getParameter("id"));
		    boolean re = service.no(id);
	        try {
				response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=loveUserList");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //重定向防止重复提交哦
	}


	/**
	 * 管理员审核通过
	 * @param request
	 * @param response
	 */
	private void yes(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		  int id=Integer.parseInt(request.getParameter("id"));
		    boolean re = service.yes(id);
	        try {
				response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=loveUserList");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //重定向防止重复提交哦
	}


	private void sh(HttpServletRequest request, HttpServletResponse response) {
		try {
		    int id=Integer.parseInt(request.getParameter("id"));
            request.setAttribute("id" ,id);
			request.getRequestDispatcher("/WEB-INF/jsp/loveSh.jsp").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}


	/**
	 * 删除爱心人士用户
	 * @param request
	 * @param response
	 */
	private void deleteLoveUser(HttpServletRequest request,
			HttpServletResponse response) {
		    int id=Integer.parseInt(request.getParameter("id"));
		    boolean re = service.deleteLoveUser(id);
	        try {
				response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=loveUserList");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //重定向防止重复提交哦
		
	}


	/**
	 * 分页查询爱心人士
	 * @param request
	 * @param response
	 */
	private void loveUserList(HttpServletRequest request,
			HttpServletResponse response) {
		   String p=request.getParameter("p");//接收页码
	        int pageSize=4;//每页显示5条
	        int pageNum=1; //默认第一页
	        if(p!=null){
	            pageNum= Integer.parseInt(p);
	        }
	       String flag = request.getSession().getAttribute("flag").toString();
	       LoveUser loveUser = (LoveUser)request.getSession().getAttribute("loveUser");

	       List<LoveUser> list = new ArrayList<>();
	       if(flag.equals("1")){
	           list=service.selectLoveUserListPage(pageNum,pageSize);
	       }else{
	    	   list=service.selectLoveUserList2(loveUser.getId());
	       }

	        //调用分页查询
	       // List<Animal> list=service.getAnimalPage(pageNum,pageSize);
	        //携带参数到页面
	       // request.setAttribute("userList",bList); //绑定参数
	        int nums=service.queryLoveUserCount(); //查询总数
	        //计算总页数
	        int totalPage=(nums%pageSize==0)? (nums/pageSize):(nums/pageSize+1);
	        request.setAttribute("cp",pageNum); //当前页
	        request.setAttribute("tp",totalPage); //总页数
		try {
		//String name = request.getParameter("userName");
       // List<Animal> list=service.selectAnimalList(name);
        request.removeAttribute("msg");
        request.setAttribute("list" ,list);
        request.getRequestDispatcher("/WEB-INF/jsp/love_user_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	/*	try {
    		String userName = request.getParameter("username");
            List<LoveUser> list=service.selectLoveUserList(userName);
            request.removeAttribute("msg");
            request.setAttribute("list" ,list);
            request.getRequestDispatcher("/WEB-INF/jsp/love_user_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	}


	/**
	 * 注册爱心人士
	 * @param request
	 * @param response
	 */
	private void registe(HttpServletRequest request,
			HttpServletResponse response) {
		String userName=request.getParameter("userName");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        String realName=request.getParameter("realName");
        String sex=request.getParameter("sex");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String type=request.getParameter("type");
        if(!service.existsUserName(userName)){
            System.out.println(userName+"用户名已存在");
            request.setAttribute("msg","用户名已存在");
            request.setAttribute("userName",userName);
            request.setAttribute("email",email);
            try {
				request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }else{
        	LoveUser loveUser = new LoveUser();
        	loveUser.setAddress(address);
        	loveUser.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
        	loveUser.setEmail(email);
        	loveUser.setPassword(password);
        	loveUser.setPhone(phone);
        	loveUser.setRealName(realName);
        	loveUser.setSex(sex);
        	loveUser.setState("2");
        	loveUser.setType(type);
        	loveUser.setUserName(userName);
            boolean success = service.registerUser(loveUser);
            try {
            	if(success){
            		request.getRequestDispatcher("login.jsp").forward(request,response);
            	}else{
    				request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request,response);
            	}
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        }
		
	}

	/**
	 * 去注册爱心人士界面
	 * @param request
	 * @param response
	 */
	private void toRegsite(HttpServletRequest request,
			HttpServletResponse response) {
        try {
			request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 删除管理员
	 * @param request
	 * @param response
	 */
	private void deleteAdmin(HttpServletRequest request,
			HttpServletResponse response) {
            int id=Integer.parseInt(request.getParameter("id"));
		    boolean re = service.deleteAdminUser(id);
	        try {
				response.sendRedirect(request.getContextPath()+"/AdminUserServlet?action=adminList");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //重定向防止重复提交哦
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	/**
	 * 登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//处理登录
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
        int type = 0;
        AdminUser adminUser = new AdminUser();
        adminUser.setUserName(username);
        adminUser.setPassword(password);
        LoveUser loveUser =new LoveUser();
        loveUser.setUserName(username);
        loveUser.setPassword(password);
        if(request.getParameter("type") != null){
        	type = Integer.parseInt(request.getParameter("type"));
        }
        if(type == 1){
        	 AdminUser user = service.login(adminUser);
        	 if (user == null){
	        	  request.setAttribute("message", "管理员用户不存在或者密码错误");
				  request.getRequestDispatcher("/login.jsp").forward(request, response); 
	         }else {
	        	  request.getSession().setAttribute("user",user);
	        	  request.getSession().setAttribute("flag",1);
	              request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
	         }
        }else if(type == 2){
        	 LoveUser loveUser1 = service.loveLogin(loveUser);
        	 if (loveUser1 == null){
	        	  request.setAttribute("message", "管理员不存在或者密码错误");
				  request.getRequestDispatcher("/login.jsp").forward(request, response);  
	         }else {
	        	  request.getSession().setAttribute("loveUser",loveUser1);
	        	  request.getSession().setAttribute("flag",2);
	              /*request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);*/
	              //request.getRequestDispatcher("shouye.jsp").forward(request, response);
					response.sendRedirect(request.getContextPath()+"/IndexServlet?action=AnimalListAct");
	         }
        }else {
        	 request.getRequestDispatcher("/login.jsp").forward(request, response); 
        }
     }
    
    
    protected void toMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//处理注册
        request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request,response);
    }
	
    protected void welcome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//处理注册
        request.getRequestDispatcher("/WEB-INF/jsp/console.jsp").forward(request,response);
    }
    
    /**
     * 管理员列表
     * @param request
     * @param response
     */
    private void adminList(HttpServletRequest request,
			HttpServletResponse response)  {
    	   String p=request.getParameter("p");//接收页码
	        int pageSize=4;//每页显示5条
	        int pageNum=1; //默认第一页
	        if(p!=null){
	            pageNum= Integer.parseInt(p);
	        }
            List<AdminUser> list=service.selectAdminListPage(pageNum,pageSize);

	        //调用分页查询
	       // List<Animal> list=service.getAnimalPage(pageNum,pageSize);
	        //携带参数到页面
	       // request.setAttribute("userList",bList); //绑定参数
	        int nums=service.queryAdminUserCount(); //查询总数
	        //计算总页数
	        int totalPage=(nums%pageSize==0)? (nums/pageSize):(nums/pageSize+1);
	        request.setAttribute("cp",pageNum); //当前页
	        request.setAttribute("tp",totalPage); //总页数
		try {
 		//String name = request.getParameter("userName");
        // List<Animal> list=service.selectAnimalList(name);
         request.removeAttribute("msg");
         request.setAttribute("list" ,list);
         request.getRequestDispatcher("/WEB-INF/jsp/admin_user_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}
    
    
    /**
     * 去登录页面
     * @param request
     * @param response
     */
    private void toLogin(HttpServletRequest request,
			HttpServletResponse response) {
	   	 try {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	   	return;
	}

}
