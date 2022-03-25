package berkeley;

import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.ws.Holder;

@WebService(serviceName = "ExamForBerkeley")
public class ExamForBerkeley {

    @WebMethod(operationName = "getInputData")
    public String getInputData(@WebParam(name = "username") String username, 
            @WebParam(name = "password") String password, 
            @WebParam(name = "examId") int examId, 
            @WebParam(name = "questionId") long questionId, 
            @WebParam(name = "memberTimes", mode = WebParam.Mode.OUT) Holder<String[]> memberTimes) {
        if(!username.equals("") && !password.equals("") && examId != 0
                && questionId != 0 && memberTimes != null){
            memberTimes.value = new String[5];
            memberTimes.value[0] = "2021-10-28 07:55:02.239";
            memberTimes.value[1] = "2021-10-28 07:54:02.114";
            memberTimes.value[2] = "2021-10-28 07:56:02.414";
            memberTimes.value[3] = "2021-10-28 07:54:02.014";
            memberTimes.value[4] = "2021-10-28 07:56:02.514";
            return "Thanh cong";
        }
        return "Chua du tham so";
    }
    
        @WebMethod(operationName = "submit")
    public String submit(@WebParam(name = "username") String username, 
            @WebParam(name = "password") String password, 
            @WebParam(name = "examId") int examId, 
            @WebParam(name = "questionId") long questionId, 
            @WebParam(name = "calibrateMs") @XmlElement(required = true, nillable = false) List<Integer> calibrateMs, 
            @WebParam(name = "correctedDateTime") String correctedDateTime) {
        if(!username.equals("") && !password.equals("") && examId != 0
                && questionId != 0 && calibrateMs != null && !correctedDateTime.equals("")){
            int[] calibratedRes = {20, 60145, -60155, 60245, -60255};
            for(int i = 0; i < calibratedRes.length; i++){
                if(calibrateMs.get(i) != calibratedRes[i])
                    return "Sai";
            }
            if(!correctedDateTime.equals("2021-10-28 07:55:02.259"))
                return "Sai";
            return "Dung";
        }
        return "Thieu tham so";
    }
}
