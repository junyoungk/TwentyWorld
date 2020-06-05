package attraction.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AttrCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
