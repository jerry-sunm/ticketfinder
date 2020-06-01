package ticket.finder.dao;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.Question;
import ticket.finder.dto.QuestionRe;

public interface QuestionDAO {
	int insertQuestion(Question question);
	int insertQuestionAdmin(Question question);
	int updateStateQuestion(int questionNum);
	Question selectQuestion(int questionNum);
	List<Question> selectRefQuestion(int questionRef, String questionUserId);
	List<Question> selectIdQuestion(String questionUserId);
	List<QuestionRe> selectQuestionList();
	List<QuestionRe> selectUserQuestionIdList(String questionUserId);
	List<Question> selectUserQuestionList(Map<String, String> map);
	int selectQuestionCount(String questionUserId);	
}
