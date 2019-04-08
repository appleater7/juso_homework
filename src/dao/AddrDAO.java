package dao;

import java.util.List;
import java.util.Map;

public interface AddrDAO {
	public List<Map<String,String>> selectAddrList(Map<String,String> addr);
	public int selectTotalAddrCnt(Map<String, String> addr);
}
