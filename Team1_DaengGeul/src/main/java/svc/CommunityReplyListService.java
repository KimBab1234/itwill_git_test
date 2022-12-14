package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CommunityDAO;
import db.JdbcUtil;
import vo.Reply;

public class CommunityReplyListService {

	public ArrayList<Reply> communityReplyList(int idx, String id) {
		ArrayList<Reply> replyList = null;
		
		Connection con = JdbcUtil.getConnection();
		CommunityDAO dao = CommunityDAO.getInstance();
		dao.setConnection(con);
		
		replyList = dao.selectReplyList(idx, id);
		
		JdbcUtil.close(con);
		
		return replyList;
	}


}
