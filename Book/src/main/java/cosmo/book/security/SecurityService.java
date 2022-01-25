package cosmo.book.security;

import org.springframework.stereotype.Service;

import cosmo.book.vo.User;

@Service
public interface SecurityService {
    String createToken(String subject, long ttlMillis);
 
    String getSubject(String token);
}