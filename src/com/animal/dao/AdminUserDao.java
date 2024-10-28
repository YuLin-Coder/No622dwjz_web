package com.animal.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.animal.entity.AdminUser;
import com.animal.entity.Animal;
import com.animal.entity.AnimalRecord;
import com.animal.entity.AnimalSaveRecord;
import com.animal.entity.AnimalZr;
import com.animal.entity.FeedWay;
import com.animal.entity.Hfjl;
import com.animal.entity.LoveUser;
import com.animal.utils.C3p0Utils;

public class AdminUserDao {

	private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());

	/**
	 * 管理员登录 
	 * @param userName
	 * @param password
	 * @return
	 */
	public AdminUser login(String userName, String password) {
		try {//返回查询的信息
            return runner.query("select * from user_admin where userName=? and password=?", new BeanHandler<AdminUser>(AdminUser.class),userName,password);
        } catch (SQLException e) {
            throw new RuntimeException("管理员登录异常！",e);//抛出运行异常
        }
	}

	/**
	 * 爱心人士登录
	 * @param realName
	 * @param password
	 * @return
	 */
	public LoveUser loveLogin(String userName, String password) {
		try {//返回查询的信息
            return runner.query("select * from user_love_animal where userName=? and password=? and state = ? ", new BeanHandler<LoveUser>(LoveUser.class),userName,password,"1");
        } catch (SQLException e) {
            throw new RuntimeException("爱心人士登录异常！",e);//抛出运行异常
        }
	}

	/**
	 * 管理员列表
	 * @return
	 */
	public List<AdminUser> selectAdminList(String userName) {
		 String sql="select * from user_admin ";
	        List<AdminUser> list=null;
	        List<String> list1 = new ArrayList<String>();
	        Object[] params = {};
	        if (userName != null && !userName.equals("")) {
	            sql += " where userName like  ? ";
	            list1.add("%" + userName + "%");
	        }
	        if(list1.size() > 0){
	            params = list1.toArray();
	        }
	        try {
	            list=runner.query(sql, params, new BeanListHandler<AdminUser>(AdminUser.class));
	            System.out.println(list.size());
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException("查询管理员列表异常！",e);
	        }
	        return list;
	}

	/**
	 * 删除管理员
	 * @param id
	 * @return
	 */
	public boolean deleteAdminUser(int id) {
		boolean re = false;
		 try {
	            runner.update("delete from user_admin where id=?",id);
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 通过用户名查找是否有重复的用户名
	 * @param userName
	 * @return
	 */
	public boolean existsUserName(String userName) {
		boolean bo = false;
		try {//返回查询的信息
            Object re = runner.query("select * from user_love_animal where userName=?", new BeanHandler<LoveUser>(LoveUser.class),userName);
            if(re == null){
            	bo = true;
            }
		} catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }
		return bo;
	}

	/**
	 * 爱心人士注册
	 * @param loveUser
	 * @return
	 */
	public boolean registerUser(LoveUser loveUser) {
		boolean re = false;
		 try {
	            runner.update("insert into user_love_animal (email,password,realName,sex,phone,address,createTime,state,type,userName) values (?,?,?,?,?,?,?,?,?,?)",
	            		loveUser.getEmail(),loveUser.getPassword(),loveUser.getRealName(),loveUser.getSex(),loveUser.getPhone(),loveUser.getAddress(),loveUser.getCreateTime(),loveUser.getState(),loveUser.getType(),loveUser.getUserName());
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
		return re;
	}

	/**
	 * 爱心人士列表
	 * @param userName
	 * @return
	 */
	public List<LoveUser> selectLoveUserList(String userName) {
		 String sql="select * from user_love_animal ";
	        List<LoveUser> list=null;
	        List<String> list1 = new ArrayList<String>();
	        Object[] params = {};
	        if (userName != null && !userName.equals("")) {
	            sql += " where userName like  ? ";
	            list1.add("%" + userName + "%");
	        }
	        if(list1.size() > 0){
	            params = list1.toArray();
	        }
	        try {
	            list=runner.query(sql, params, new BeanListHandler<LoveUser>(LoveUser.class));
	            System.out.println(list.size());
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException("查询爱心人士列表异常！",e);
	        }
	        return list;
	}

	/**
	 * 删除爱心人士
	 * @param id
	 * @return
	 */
	public boolean deleteLoveUser(int id) {
		boolean re = false;
		 try {
	            runner.update("delete from user_love_animal where id=?",id);
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 审核爱心人士不通过
	 * @param id
	 * @return
	 */
	public boolean no(int id) {
		boolean re = false;
		 try {
	            runner.update("update user_love_animal set state=?  where id=? ","0",id);
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 审核爱心人士通过
	 * @param id
	 * @return
	 */
	public boolean yes(int id) {
		boolean re = false;
		 try {
	            runner.update("update user_love_animal set state=?  where id=? ","1",id);
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 宠物列表
	 * @param userName
	 * @return
	 */
	public List<Animal> selectAnimalList(String name) {
		 String sql="select a.*,(select count(1) from feed f where  f.animal_id = a.id ) as count from animal a  ";
	        List<Animal> list=null;
	        List<String> list1 = new ArrayList<String>();
	        Object[] params = {};
	        if (name != null && !name.equals("")) {
	            sql += " where a.name like  ? ";
	            list1.add("%" + name + "%");
	        }
	        if(list1.size() > 0){
	            params = list1.toArray();
	        }
	        try {
	            list=runner.query(sql, params, new BeanListHandler<Animal>(Animal.class));
	            System.out.println(list.size());
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException("查询宠物列表异常！",e);
	        }
	        return list;
	}

	/**
	 * 删除宠物信息
	 * @param id
	 * @return
	 */
	public boolean deleteAnimal(int id) {
		boolean re = false;
		 try {
	            runner.update("delete from animal where id=?",id);
	            runner.update("delete from animal_save_record where animal_id=?",id);
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 新增宠物信息
	 * @param animal
	 * @return
	 */
	public boolean addAnimal(Animal animal) {
		boolean re = false;
		 try {
	            runner.update("insert into animal (name,type,state,createTime,nickName,imgUrl,ano) values (?,?,?,?,?,?,?)",
	            		animal.getName(),animal.getType(),"0",animal.getCreateTime(),animal.getNickName(),animal.getImgUrl(),animal.getAno());
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
		return re;
	}

	/**
	 * 领养宠物
	 * @param animal_id
	 * @param user_id
	 * @return
	 */
	public boolean lyAnimal(int animal_id, int user_id) {
		boolean re = false;
		 try {
			 runner.update("update animal set state=?  where id=? ","1",animal_id);
			 runner.update("insert into animal_save_record (createTime,animal_id,user_id,type) values (?,?,?,?)",
					 new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()),animal_id,user_id,"1");
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 动物领养记录
	 * @return
	 */
	public List<AnimalRecord> selectAnimalRecordList(String flag) {
		String sql = "";
		if(flag.equals("")){//管理员
			 sql="select s.type as animal_type,s.createTime,s.user_id,s.animal_id,s.lyid ,a.name ,a.imgUrl,a.type,a.nickName,a.ano as ano "
			 		+ " , ul.realName ,ul.address ,ul.sex ,ul.phone from animal_save_record s "
			 		+ "left join animal a on s.animal_id = a.id "
			 		+ "left join user_love_animal ul on ul.id = s.user_id  ";
		}else if(flag.equals("hfjl")){
			sql="select s.type as animal_type,s.createTime,s.user_id,s.animal_id,s.lyid ,a.name ,a.imgUrl,a.type,a.nickName,a.ano as ano "
			 		+ " , ul.realName ,ul.address ,ul.sex ,ul.phone from animal_save_record s "
			 		+ "left join animal a on s.animal_id = a.id "
			 		+ "left join user_love_animal ul on ul.id = s.user_id where s.type = ? ";
		}else{
			sql="select s.type as animal_type,s.createTime,s.user_id,s.animal_id,s.lyid ,a.name ,a.imgUrl,a.type,a.nickName,a.ano as ano "
			 		+ " , ul.realName ,ul.address ,ul.sex ,ul.phone from animal_save_record s "
			 		+ "left join animal a on s.animal_id = a.id "
			 		+ "left join user_love_animal ul on ul.id = s.user_id  where s.user_id = ? ";
		}
	        List<AnimalRecord> list=null;
	        List<String> list1 = new ArrayList<String>();
	      /*  Object[] params = {};
	        if (name != null && !name.equals("")) {
	            sql += " where name like  ? ";
	            list1.add("%" + name + "%");
	        }
	        if(list1.size() > 0){
	            params = list1.toArray();
	        }*/
	        try {
	        	if(flag.equals("")){
		            list=runner.query(sql, new BeanListHandler<AnimalRecord>(AnimalRecord.class));
	        	}else if(flag.equals("hfjl")){
		            list=runner.query(sql, new BeanListHandler<AnimalRecord>(AnimalRecord.class),"1");
	        	}else{
		            list=runner.query(sql, new BeanListHandler<AnimalRecord>(AnimalRecord.class),Integer.parseInt(flag));
	        	}
	        	
	        	 if(list != null && list.size()>0){
		            	for(AnimalRecord am : list){
		            		String id = am.getAnimal_id();
		    	            Object ways = runner.query(" select wyfs from feed where animal_id =?  ", new ScalarHandler(),id);
		    	            if(ways != null){
		    	            	am.setWays(ways.toString());
		    	            }else{
			    	            am.setWays("");

		    	            }
		            	}
		            }
	            System.out.println(list.size());
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException("动物领养记录列表异常！",e);
	        }
	        return list;
	}

	/**
	 * 添加喂养方式
	 * @param feedWay
	 * @return
	 */
	public boolean addFeedWay(FeedWay feedWay) {
		boolean re = false;
		 try {
			 runner.update("insert into feed (animal_name,wyfs,animal_id) values (?,?,?)",
					 feedWay.getAnimal_name(),feedWay.getWyfs(),feedWay.getAnimal_id());
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 查询喂养方式
	 * @param id
	 * @return
	 */
	public FeedWay selectFeedWay(String id) {
		try {//返回查询的信息
	            return runner.query("select * from feed where animal_id=?", new BeanHandler<FeedWay>(FeedWay.class),id);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }
	}

	/**
	 * 分页查询动物
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<Animal> getAnimalPage(int pageNum, int pageSize) {
		 String sql="select * from animal limit ?,?";
	        int startNo=(pageNum-1)*pageSize;
	        List<Animal> list=null;
	        try {
	            list= runner.query(sql, new BeanListHandler<Animal>(Animal.class),new Object[] {startNo,pageSize});//添加实体类的适配器进行类的反射
	            
	            if(list != null && list.size()>0){
	            	for(Animal am : list){
	            		Integer id = am.getId();
	    	            Long count =  (Long) runner.query(" select count(1) from feed where animal_id =?  ", new ScalarHandler(),id);
	    	            Object ways = runner.query(" select wyfs from feed where animal_id =?  ", new ScalarHandler(),id);
	    	            if(ways != null){
	    	            	am.setWays(ways.toString());
	    	            }else{
		    	            am.setWays("");

	    	            }
	    	            Integer counts = count.intValue();
	    	            am.setCount(counts);
	            	}
	            }
	            return list;
	        } catch (SQLException e) {//捕获异常
	            throw new RuntimeException(e);//抛出运行异常
	        }
	}

	/**
	 * 返回宠物总数量
	 * @return
	 */
	public int queryAnimalCount() {
		String sql="select count(*) from animal";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler());
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
	}

	/**
	 * 通过id查询宠物信息
	 * @param animal_id
	 * @return
	 */
	public Animal selectAnimalById(String animal_id) {
		try {//返回查询的信息
            return runner.query("select * from animal where id=?", new BeanHandler<Animal>(Animal.class),Integer.parseInt(animal_id));
        } catch (SQLException e) {
            throw new RuntimeException("查询宠物信息异常！",e);//抛出运行异常
        }
	}

	/**
	 * 通过id查询爱心人士信息
	 * @param user_id
	 * @return
	 */
	public LoveUser selectLoveUserById(String user_id) {
		try {//返回查询的信息
            return runner.query("select * from user_love_animal where id=?", new BeanHandler<LoveUser>(LoveUser.class),Integer.parseInt(user_id));
        } catch (SQLException e) {
            throw new RuntimeException("查询宠物信息异常！",e);//抛出运行异常
        }
	}

	/**
	 * 新增宠物转让记录
	 * @param animalZr
	 * @return
	 */
	public boolean addAnimalZr(AnimalZr animalZr,String lyid) {
		boolean re = false;
		 try {
	         LoveUser loveUser= runner.query("select * from user_love_animal where id=?", new BeanHandler<LoveUser>(LoveUser.class),animalZr.getYzr_id());
	         animalZr.setXzr_phone(loveUser.getPhone());
	         animalZr.setXzr(loveUser.getRealName());
			 runner.update("insert into animal_zr "
			 		+ "(aniaml_name,animal_type,yzr,yzr_phone,xzr,xzr_phone,zr_way,createTime,animal_id,"
			 		+ "yzr_id,xzr_id,time,state,ano) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
			 		animalZr.getAniaml_name(),animalZr.getAnimal_type(),animalZr.getYzr(),animalZr.getYzr_phone(),animalZr.getXzr(),animalZr.getXzr_phone(),
			 		animalZr.getZr_way(),animalZr.getCreateTime(),animalZr.getAnimal_id(),animalZr.getYzr_id(),
			 		animalZr.getXzr_id(),animalZr.getTime(),"1",animalZr.getAno());
			 runner.update("update animal_save_record set type=?  where lyid=? ","3",Integer.parseInt(lyid));
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 查找宠物转让审核记录
	 * @param id
	 * @return
	 */
	public List<AnimalZr> selectAnimalZrList(Integer id) {
		String sql = "";
		if(id == 0){//管理员
			 sql="select s.* , a.imgUrl as img ,ul.realName as xzrName ,ul.phone as xzrPhone from animal_zr s left join animal a on s.animal_id = a.id left join user_love_animal"
			 		+ " ul on ul.id = s.xzr_id  where s.state <> ?  ";
		}else{
			 sql="select s.* , a.imgUrl as img ,ul.realName as xzrName ,ul.phone as xzrPhone from animal_zr s left join animal a on s.animal_id = a.id left join user_love_animal"
			 		+ " ul on ul.id = s.xzr_id  where s.xzr_id =?";

		}
	        List<AnimalZr> list=null;
	        List<String> list1 = new ArrayList<String>();
	      /*  Object[] params = {};
	        if (name != null && !name.equals("")) {
	            sql += " where name like  ? ";
	            list1.add("%" + name + "%");
	        }
	        if(list1.size() > 0){
	            params = list1.toArray();
	        }*/
	        try {
	        	if(id == 0){
		            list=runner.query(sql, new BeanListHandler<AnimalZr>(AnimalZr.class),"1");
	        	}else{
		            list=runner.query(sql, new BeanListHandler<AnimalZr>(AnimalZr.class),id);
	        	}
	            System.out.println(list.size());
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException("动物领养记录列表异常！",e);
	        }
	        return list;
	}

	/**
	 * 转让不同意
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean zrNo(int id, String state) {
		boolean re = false;
		 try {
			 AnimalSaveRecord asr = runner.query("select r.* from animal_save_record r "
	         		+ "left join animal_zr z on z.animal_id = r.animal_id"
	         		+ "  where  z.id=?", new BeanHandler<AnimalSaveRecord>(AnimalSaveRecord.class),id);
	            runner.update("update animal_zr set state=?  where id=? ","0",id);
	            runner.update("update animal_save_record set type=?  where lyid=? ","1",asr.getLyid());
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 转让同意
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean zrYes(int id, String state) {
		boolean re = false;
		 try {
			 AnimalSaveRecord asr = runner.query("select r.* from animal_save_record r "
		         		+ "left join animal_zr z on z.animal_id = r.animal_id"
		         		+ "  where  z.id=?", new BeanHandler<AnimalSaveRecord>(AnimalSaveRecord.class),id);

			 AnimalZr animalZr = runner.query("select * from animal_zr where id =? ",
					 new BeanHandler<AnimalZr>(AnimalZr.class),id);
			 Integer user_id = animalZr.getXzr_id();
			 Integer animal_id =animalZr.getAnimal_id();
			 if(state.equals("1")){
				runner.update("update animal_zr set state=?  where id=? ","2",id);
			 }else{
				runner.update("update animal_zr set state=?  where id=? ","3",id);
		        runner.update("update animal_save_record set type=?  where lyid=?  ","2",asr.getLyid());
		        runner.update("insert into  animal_save_record (animal_id ,user_id ,createTime,type) "
		        		+ "values (?,?,?,?)  ",animal_id,user_id,new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()),"1");

			 }
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 查询回访记录总数
	 * @return
	 */
	public int queryHfjlCount() {
		String sql="select count(*) from hfjl";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler());
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
	}

	/**
	 * 分页查询回访记录
	 * @param pageNum
	 * @param pageSize
	 * @param map
	 * @return
	 */
	public List<Hfjl> getHfjlPage(int pageNum, int pageSize,
			Map<String, Object> map) {
			StringBuilder  sql =  new StringBuilder();
			int startNo=(pageNum-1)*pageSize;
		    List<Hfjl> list=null;
			sql.append("select * from hfjl where 1 = 1 ");
			if(map.get("name") != null && !map.get("name").toString().equals("")){
				String name = "%"+map.get("name").toString()+"%";
			   sql.append("and name like ?");
			   sql.append("limit ?,? ");
			   try {
		           list= runner.query(sql.toString(), new BeanListHandler<Hfjl>(Hfjl.class),new Object[] {name,startNo,pageSize});//添加实体类的适配器进行类的反射
		        } catch (SQLException e) {//捕获异常
		            throw new RuntimeException(e);//抛出运行异常
		        }
			}else{
				sql.append("limit ?,? ");
			    try {
			        list= runner.query(sql.toString(), new BeanListHandler<Hfjl>(Hfjl.class),new Object[] {startNo,pageSize});//添加实体类的适配器进行类的反射
		        } catch (SQLException e) {//捕获异常
		            throw new RuntimeException(e);//抛出运行异常
		        }
			}
			return list;
	}

	/**
	 * 新增回访记录
	 * @param hfjl
	 * @return
	 */
	public boolean addHfjl(Hfjl hfjl) {
		boolean re = false;
		 try {
	            runner.update("insert into hfjl "
	            		+ "(name,category,director,condation,hfz,hfrq,director_id,animal_id,imgUrl)"
	            		+ " values (?,?,?,?,?,?,?,?,?)",
	            		hfjl.getName(),hfjl.getCategory(),hfjl.getDirector(),hfjl.getCondation(),hfjl.getHfz(),hfjl.getHfrq()
	            		,hfjl.getDirector_id(),hfjl.getAnimal_id(),hfjl.getImgUrl());
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
		return re;

	}

	/**
	 * 删除回访记录
	 * @param id
	 * @return
	 */
	public boolean deleteHfjl(int id) {
		boolean re = false;
		 try {
	            runner.update("delete from hfjl where id=?",id);
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 通过id查询回访记录
	 * @param id
	 * @return
	 */
	public Hfjl selectHfjlById(int id) {
		try {//返回查询的信息
            return runner.query("select * from hfjl where id = ? ", new BeanHandler<Hfjl>(Hfjl.class),id);
        } catch (SQLException e) {
            throw new RuntimeException("查询回访记录异常！",e);//抛出运行异常
        }
	}

	/**
	 * 修改回访记录
	 * @param hfjl
	 * @return
	 */
	public boolean editHfjl(Hfjl hfjl) {
		boolean re = false;
		 try {
	            runner.update("update hfjl set hfz=? , hfrq=? ,condation =?  where id=? "
	            		,hfjl.getHfz(),hfjl.getHfrq(),hfjl.getCondation(),hfjl.getId());
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 分页查询管理员
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<AdminUser> selectAdminListPage(int pageNum, int pageSize) {
		String sql="select * from user_admin limit ?,?";
        int startNo=(pageNum-1)*pageSize;
        List<AdminUser> list=null;
        try {
            list= runner.query(sql, new BeanListHandler<AdminUser>(AdminUser.class),new Object[] {startNo,pageSize});//添加实体类的适配器进行类的反射
            return list;
        } catch (SQLException e) {//捕获异常
            throw new RuntimeException(e);//抛出运行异常
        }
	}

	/**
	 * 查询所有admin数量
	 * @return
	 */
	public int queryAdminUserCount() {
		String sql="select count(*) from user_admin";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler());
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
	}

	/**
	 * 通过id查询admin的信息
	 * @param id
	 * @return
	 */
	public AdminUser selectAdminById(int id) {
		try {//返回查询的信息
            return runner.query("select * from user_admin where id = ? ", new BeanHandler<AdminUser>(AdminUser.class),id);
        } catch (SQLException e) {
            throw new RuntimeException("查询admin的信息异常！",e);//抛出运行异常
        }
	}

	/**
	 * 修改管理员信息
	 * @param adminUser
	 * @return
	 */
	public boolean editAdmin(AdminUser adminUser) {
		boolean re = false;
		 try {
	            runner.update("update user_admin set userName=? , password=? ,realName =?  where id=? "
	            		,adminUser.getUserName(),adminUser.getPassword(),adminUser.getRealName(),adminUser.getId());
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 通过id查询爱心人士信息
	 * @param id
	 * @return
	 */
	public LoveUser selectLoveUserById(int id) {
		try {//返回查询的信息
            return runner.query("select * from user_love_animal where id = ? ", new BeanHandler<LoveUser>(LoveUser.class),id);
        } catch (SQLException e) {
            throw new RuntimeException("查询爱心人士的信息异常！",e);//抛出运行异常
        }
	}

	/**
	 * 修改爱心人士信息
	 * @param loveUser
	 * @return
	 */
	public boolean editLoveUser(LoveUser loveUser) {
		boolean re = false;
		 try {
	            runner.update("update user_love_animal set userName=? , password=? ,realName =?"
	            		+ ",email =? , phone=? , address=? where id=? "
	            		,loveUser.getUserName(),loveUser.getPassword(),loveUser.getRealName(),loveUser.getEmail()
	            		,loveUser.getPhone(),loveUser.getAddress(),loveUser.getId());
	            re = true;
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
		return re;
	}

	/**
	 * 爱心人士模糊查询
	 * @param userName
	 * @return
	 */
	public List<LoveUser> likeLoveUserList(String userName) {
		String sql="select * from user_love_animal ";
        List<LoveUser> list=null;
        List<String> list1 = new ArrayList<String>();
        Object[] params = {};
        if (userName != null && !userName.equals("")) {
            sql += " where userName like  ? ";
            list1.add("%" + userName + "%");
        }
        if(list1.size() > 0){
            params = list1.toArray();
        }
        try {
            list=runner.query(sql, params, new BeanListHandler<LoveUser>(LoveUser.class));
            System.out.println(list.size());
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("查询爱心人士列表异常！",e);
        }
        return list;
	}

	/**
	 * 返回爱心人士数量
	 * @return
	 */
	public int queryLoveUserCount() {
		// TODO Auto-generated method stub
		String sql="select count(*) from user_love_animal";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler());
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
	}

	/**
	 * 分页查询爱人人士
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<LoveUser> selectLoveUserListPage(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		String sql="select * from user_love_animal limit ?,?";
        int startNo=(pageNum-1)*pageSize;
        List<LoveUser> list=null;
        try {
            list= runner.query(sql, new BeanListHandler<LoveUser>(LoveUser.class),new Object[] {startNo,pageSize});//添加实体类的适配器进行类的反射
            return list;
        } catch (SQLException e) {//捕获异常
            throw new RuntimeException(e);//抛出运行异常
        }
	}

	/**
	 * 返回爱心人士列表信息
	 * @param id
	 * @return
	 */
	public List<LoveUser> selectLoveUserList2(Integer id) {
		String sql="select * from user_love_animal where id =?";
        List<LoveUser> list=null;
        try {
            list=runner.query(sql, new BeanListHandler<LoveUser>(LoveUser.class),id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("查询爱心人士列表异常！",e);
        }
        return list;
	}


	

}
