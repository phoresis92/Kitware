package project.groupware.member;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("memberService") // bean 이름
public class ServiceImpl implements Service{
	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private Dao dao;
		
	@Override
	public int getIdNum() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.makeIdNum();
	}
	
	@Override
	public void joinMember(Member m) {
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(m);
	}
	
	@Override
	public ArrayList<Member> getAll() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}
	
	@Override
	public ArrayList<Member> getCondition(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectCondition(map);
	}
	
	@Override
	public Member getMember(int member_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectMember(member_id);
	}

//	@Override
//	public String getName(int member_id) {
//		dao = sqlSession.getMapper(Dao.class);
//		return dao.selectName(member_id);
//	}
	
	@Override
	public String[] getName(String member_email) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectName(member_email);
	}

	@Override
	public ArrayList<Integer> getId(Member m) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectId(m);
	};
	
	@Override
	public String getPw(Member m) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectPw(m);
	};
	
	@Override
	public String getEmail(Member m) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectEmail(m);
	};

	@Override
	public void editMember(Member m) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.update(m);
	}
	
	@Override
	public void editPw(Member m) {
		dao = sqlSession.getMapper(Dao.class);
		dao.updatePw(m);
	}
	
	@Override
	public boolean checkLogin(int member_id, String member_pw) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		boolean flag = false;
		Member m = dao.selectMember(member_id);
		if (m == null) {return flag;}
		if (m.getMember_pw() != null && m.getMember_pw().equals(member_pw)) {		
			flag = true;
		}
		return flag;
	}
	
	@Override
	public void delMember(int member_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.delete(member_id);
	}
	
	
	

	@Override
	public ArrayList<Member> getAllMemJoin() {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectAllMemJoin();
	}

	@Override
	public ArrayList<Member> searchByDeptId(int member_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectByDeptId(member_id);
	}

	@Override
	public ArrayList<Member> searchByName(String searchName) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectByName("%"+searchName+"%");
	}

	@Override
	public Member searchById(int member_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectById(member_id);
	}

	
}