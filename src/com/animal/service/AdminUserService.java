package com.animal.service;

import java.util.List;
import java.util.Map;

import com.animal.entity.AdminUser;
import com.animal.entity.Animal;
import com.animal.entity.AnimalRecord;
import com.animal.entity.AnimalZr;
import com.animal.entity.FeedWay;
import com.animal.entity.Hfjl;
import com.animal.entity.LoveUser;

public interface AdminUserService {

	/**
	 * 登录
	 * @param adminUser
	 * @return
	 */
	AdminUser login(AdminUser adminUser);

	/**
	 * 爱心人士登录
	 * @param adminUser
	 * @return
	 */
	LoveUser loveLogin(LoveUser loveUser);

	/**
	 * 管理员列表
	 * @param userName 
	 * @return
	 */
	List<AdminUser> selectAdminList(String userName);

	/**
	 * 删除管理员信息
	 * @param id
	 * @return 
	 */
	boolean deleteAdminUser(int id);

	/**
	 * 通过用户名查找是否有重复的用户名
	 * @param userName
	 * @return
	 */
	boolean existsUserName(String userName);

	/**
	 * 爱心人士注册
	 * @param loveUser
	 */
	boolean registerUser(LoveUser loveUser);

	/**
	 * 爱心人士列表展示
	 * @param userName
	 * @return
	 */
	List<LoveUser> selectLoveUserList(String userName);

	/**
	 * 删除爱心人士账号
	 * @param id
	 * @return
	 */
	boolean deleteLoveUser(int id);

	/**
	 * 审核爱心人士不通过
	 * @param id
	 * @return
	 */
	boolean no(int id);

	/**
	 * 审核爱心人士通过
	 * @param id
	 * @return
	 */
	boolean yes(int id);

	/**
	 * 宠物列表
	 * @param userName
	 * @return
	 */
	List<Animal> selectAnimalList(String userName);

	/**
	 * 删除宠物信息
	 * @param id
	 * @return
	 */
	boolean deleteAnimal(int id);

	/**
	 * 新增流浪动物
	 * @param animal
	 * @return
	 */
	boolean addAnimal(Animal animal);

	/**
	 * 领养宠物
	 * @param animal_id
	 * @param user_id
	 * @return
	 */
	boolean lyAnimal(int animal_id, int user_id);

	/**
	 * 领养动物记录
	 * @return
	 */
	List<AnimalRecord> selectAnimalRecordList(String flag);

	/**
	 * 新增喂养方式
	 * @param feedWay
	 * @return
	 */
	boolean addFeedWay(FeedWay feedWay);

	/**
	 * 查找喂养记录
	 * @param id
	 * @return
	 */
	FeedWay selectFeedWay(String id);

	/**
	 * 分页查询动物列表
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	List<Animal> getAnimalPage(int pageNum, int pageSize);

	/**+
	 * 返回宠物总数
	 * @return
	 */
	int queryAnimalCount();

	/**
	 * 通过id查询爱心人士
	 * @param user_id
	 * @return
	 */
	LoveUser selectLoveUserById(String user_id);

	/**
	 * 通过id查询宠物
	 * @param animal_id
	 * @return
	 */
	Animal selectAnimalById(String animal_id);

	/**
	 * 新增转让记录
	 * @param animalZr
	 * @return
	 */
	boolean addAnimalZr(AnimalZr animalZr,String lyid);

	/**
	 * 查找转让审核集合
	 * @param id
	 * @return
	 */
	List<AnimalZr> selectAnimalZrList(Integer id);

	/**
	 * 不同意
	 * @param id
	 * @param state
	 * @return
	 */
	boolean zrNo(int id, String state);

	/**
	 * 同意
	 * @param id
	 * @param state
	 * @return
	 */
	boolean zrYes(int id, String state);

	/**
	 * 查询回访记录总数
	 * @return
	 */
	int queryHfjlCount();

	/**
	 * 分页查询回访记录
	 * @param pageNum
	 * @param pageSize
	 * @param map
	 * @return
	 */
	List<Hfjl> getHfjlPage(int pageNum, int pageSize, Map<String, Object> map);

	/***
	 * 新增回访记录
	 * @param hfjl
	 * @return
	 */
	boolean addHfjl(Hfjl hfjl);

	/**
	 * 删除回访记录
	 * @param id
	 * @return
	 */
	boolean deleteHfjl(int id);

	/**
	 * 查询回访记录
	 * @param id
	 * @return
	 */
	Hfjl selectHfjlById(int id);

	/**
	 * 修改回访信息
	 * @param hfjl
	 * @return
	 */
	boolean editHfjl(Hfjl hfjl);

	/**
	 * 分页查询管理员
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	List<AdminUser> selectAdminListPage(int pageNum, int pageSize);

	/**
	 * 查询所有管理员数量
	 * @return
	 */
	int queryAdminUserCount();

	/**
	 * 通过id查询admin信息
	 * @param id
	 * @return
	 */
	AdminUser selectAdminById(int id);

	/**
	 * 修改管理员信息
	 * @param adminUser
	 * @return
	 */
	boolean editAdmin(AdminUser adminUser);

	/***
	 * 通过id查询爱心人士信息
	 * @param id
	 * @return
	 */
	LoveUser selectLoveUserById(int id);

	/**
	 * 修改爱心人士信息
	 * @param loveUser
	 * @return
	 */
	boolean editLoveUser(LoveUser loveUser);

	/**
	 * 爱心人士模糊查询
	 * @param userName
	 * @return
	 */
	List<LoveUser> likeLoveUserList(String userName);

	/**
	 * 分页查询爱心人士列表
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	List<LoveUser> selectLoveUserListPage(int pageNum, int pageSize);

	/**
	 * 返回爱心人士数量
	 * @return
	 */
	int queryLoveUserCount();

	/**
	 * 返回爱心人士列表信息
	 * @param id
	 * @return
	 */
	List<LoveUser> selectLoveUserList2(Integer id);
   
	
	
	
}
