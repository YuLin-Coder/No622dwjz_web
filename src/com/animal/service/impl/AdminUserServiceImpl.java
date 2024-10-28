package com.animal.service.impl;

import java.util.List;
import java.util.Map;

import com.animal.dao.AdminUserDao;
import com.animal.entity.AdminUser;
import com.animal.entity.Animal;
import com.animal.entity.AnimalRecord;
import com.animal.entity.AnimalZr;
import com.animal.entity.FeedWay;
import com.animal.entity.Hfjl;
import com.animal.entity.LoveUser;
import com.animal.service.AdminUserService;

public class AdminUserServiceImpl implements AdminUserService{

	private AdminUserDao userDao = new AdminUserDao();
	/**
	 * 登录
	 */
	@Override
	public AdminUser login(AdminUser adminUser) {
		// TODO Auto-generated method stub
		return userDao.login(adminUser.getUserName(),adminUser.getPassword());
	}

	/**
	 * 爱心人士登录
	 */
	@Override
	public LoveUser loveLogin(LoveUser loveUser) {
		// TODO Auto-generated method stub
		return userDao.loveLogin(loveUser.getUserName(),loveUser.getPassword());
	}

	/**
	 * 管理员列表
	 */
	@Override
	public List<AdminUser> selectAdminList(String userName) {
		// TODO Auto-generated method stub
		return userDao.selectAdminList(userName);
	}

	/**
	 * 删除管理员
	 */
	@Override
	public boolean deleteAdminUser(int id) {
		// TODO Auto-generated method stub
		return userDao.deleteAdminUser(id);
	}

	/**
	 * 通过用户名查询是否有重复的用户名
	 */
	@Override
	public boolean existsUserName(String userName) {
		// TODO Auto-generated method stub
		return userDao.existsUserName(userName);
	}

	/**
	 * 爱心人士注册
	 */
	@Override
	public boolean registerUser(LoveUser loveUser) {
		// TODO Auto-generated method stub
		return userDao.registerUser(loveUser);
	}

	/**
	 * 爱心人士列表
	 */
	@Override
	public List<LoveUser> selectLoveUserList(String userName) {
		// TODO Auto-generated method stub
		return userDao.selectLoveUserList(userName);
	}

	/**
	 * 删除爱心人士
	 */
	@Override
	public boolean deleteLoveUser(int id) {
		// TODO Auto-generated method stub
		return userDao.deleteLoveUser(id);
	}

	/**
	 * 审核爱心人士不通过
	 */
	@Override
	public boolean no(int id) {
		// TODO Auto-generated method stub
		return userDao.no(id);
	}

	/**
	 * 审核爱心人士通过
	 */
	@Override
	public boolean yes(int id) {
		// TODO Auto-generated method stub
		return userDao.yes(id);
	}

	/**
	 * 宠物列表
	 */
	@Override
	public List<Animal> selectAnimalList(String name) {
		// TODO Auto-generated method stub
		return userDao.selectAnimalList(name);
	}

	/**
	 * 删除宠物信息
	 */
	@Override
	public boolean deleteAnimal(int id) {
		// TODO Auto-generated method stub
		return userDao.deleteAnimal(id);
	}

	/**
	 * 新增宠物信息
	 */
	@Override
	public boolean addAnimal(Animal animal) {
		// TODO Auto-generated method stub
		return userDao.addAnimal(animal);
	}

	/**
	 * 领养宠物
	 */
	@Override
	public boolean lyAnimal(int animal_id, int user_id) {
		// TODO Auto-generated method stub
		return userDao.lyAnimal(animal_id,user_id);
	}

	/**
	 * 领养动物记录
	 */
	@Override
	public List<AnimalRecord> selectAnimalRecordList(String flag) {
		// TODO Auto-generated method stub
		return userDao.selectAnimalRecordList(flag);
	}

	/**
	 * 添加喂养方式
	 */
	@Override
	public boolean addFeedWay(FeedWay feedWay) {
		// TODO Auto-generated method stub
		return userDao.addFeedWay(feedWay);
	}

	/**
	 * 查看喂养方式
	 */
	@Override
	public FeedWay selectFeedWay(String id) {
		// TODO Auto-generated method stub
		return userDao.selectFeedWay(id);
	}

	/**
	 * 动物分页查询
	 */
	@Override
	public List<Animal> getAnimalPage(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return userDao.getAnimalPage(pageNum,pageSize);
	}

	/***
	 * 返回宠物总数量
	 */
	@Override
	public int queryAnimalCount() {
		// TODO Auto-generated method stub
		return userDao.queryAnimalCount();
	}

	/**
	 * 通过id查询爱心人士
	 */
	@Override
	public LoveUser selectLoveUserById(String user_id) {
		// TODO Auto-generated method stub
		return userDao.selectLoveUserById(user_id);
	}

	/**
	 * 通过id查询宠物信息
	 */
	@Override
	public Animal selectAnimalById(String animal_id) {
		// TODO Auto-generated method stub
		return userDao.selectAnimalById(animal_id);
	}

	/**
	 * 新增宠物转让记录
	 */
	@Override
	public boolean addAnimalZr(AnimalZr animalZr,String lyid) {
		// TODO Auto-generated method stub
		return userDao.addAnimalZr(animalZr,lyid);
	}

	/**
	 * 查询转让审核集合
	 */
	@Override
	public List<AnimalZr> selectAnimalZrList(Integer id) {
		// TODO Auto-generated method stub
		return userDao.selectAnimalZrList(id);
	}

	/**
	 * 转让不同意
	 */
	@Override
	public boolean zrNo(int id, String state) {
		// TODO Auto-generated method stub
		return userDao.zrNo(id,state);
	}

	/**
	 * 转让同意
	 */
	@Override
	public boolean zrYes(int id, String state) {
		// TODO Auto-generated method stub
		return userDao.zrYes(id,state);
	}

	/**
	 * 查询回访记录总数
	 */
	@Override
	public int queryHfjlCount() {
		return userDao.queryHfjlCount();
	}

	/**
	 * 分页查询回访记录
	 */
	@Override
	public List<Hfjl> getHfjlPage(int pageNum, int pageSize,
			Map<String, Object> map) {
		return userDao.getHfjlPage(pageNum,pageSize,map);
	}

	/**
	 * 新增回访记录
	 */
	@Override
	public boolean addHfjl(Hfjl hfjl) {
		return userDao.addHfjl(hfjl);
	}

	/**
	 * 删除回访记录
	 */
	@Override
	public boolean deleteHfjl(int id) {
		// TODO Auto-generated method stub
		return userDao.deleteHfjl(id);
	}

	/**
	 * 通过id查询回访记录
	 */
	@Override
	public Hfjl selectHfjlById(int id) {
		// TODO Auto-generated method stub
		return userDao.selectHfjlById(id);
	}

	/**
	 * 修改回访信息
	 */
	@Override
	public boolean editHfjl(Hfjl hfjl) {
		// TODO Auto-generated method stub
		return userDao.editHfjl(hfjl);
	}

	/**
	 * 分页查询管理员
	 */
	@Override
	public List<AdminUser> selectAdminListPage(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return userDao.selectAdminListPage(pageNum,pageSize);
	}

	/**
	 * 返回所有的admin的数量
	 * 
	 */
	@Override
	public int queryAdminUserCount() {
		// TODO Auto-generated method stub
		return userDao.queryAdminUserCount();
	}

	/**
	 * 通过id查询admin细信息
	 */
	@Override
	public AdminUser selectAdminById(int id) {
		// TODO Auto-generated method stub
		return userDao.selectAdminById(id);
	}

	/**
	 * 修改管理员信息
	 */
	@Override
	public boolean editAdmin(AdminUser adminUser) {
		// TODO Auto-generated method stub
		return userDao.editAdmin(adminUser);
	}

	/**
	 * 通过id查询爱心人士
	 */
	@Override
	public LoveUser selectLoveUserById(int id) {
		// TODO Auto-generated method stub
		return userDao.selectLoveUserById(id);
	}

	/**
	 * 修改爱心人士
	 */
	@Override
	public boolean editLoveUser(LoveUser loveUser) {
		// TODO Auto-generated method stub
		return userDao.editLoveUser(loveUser);
	}

	/**
	 * 爱心人士模糊查询
	 */
	@Override
	public List<LoveUser> likeLoveUserList(String userName) {
		// TODO Auto-generated method stub
		return userDao.likeLoveUserList(userName);
	}

	/**
	 * 分页查询爱心人士
	 */
	@Override
	public List<LoveUser> selectLoveUserListPage(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return userDao.selectLoveUserListPage(pageNum,pageSize);
	}

	/**
	 * 返回爱心人士数量
	 */
	@Override
	public int queryLoveUserCount() {
		// TODO Auto-generated method stub
		return userDao.queryLoveUserCount();
	}

	/**
	 * 返回爱心人士列表信息
	 */
	@Override
	public List<LoveUser> selectLoveUserList2(Integer id) {
		// TODO Auto-generated method stub
		return userDao.selectLoveUserList2(id);
	}


}
