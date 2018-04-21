package ssm.schoolmanage.util;

import java.util.UUID;

public class Getuuid {

	 //�õ�ָ��������UUID�����������ʽ����
    public static String[] getUUID(int num){

        if( num <= 0)
            return null;

        String[] uuidArr = new String[num];

        for (int i = 0; i < uuidArr.length; i++) {
            uuidArr[i] = getUUID32();
        }

        return uuidArr;
    }

    //�õ�32λ��uuid
        public static String getUUID32(){
            return UUID.randomUUID().toString().replace("-", "").toLowerCase();
        }
	
        
	
}
