package Dao;

import Model.Book;
import Model.Cart;
import Model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Dao implements UserDao, BookDao,CartDao{
    private Connection conn;

    public Dao(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean registerUser(User user) {
        boolean isRegister = false;
        try {
            String sql = "INSERT INTO users(name, email, phone, password, role) VALUES (?,?,?,?,0)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());

            if( ps.executeUpdate()==1) {
                isRegister = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRegister;
    }

    @Override
    public User loginUser(String email, String password) {
        User user = null;
        try {
            String sql = "SELECT * FROM users WHERE  email = ? and password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPhone(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setRole(rs.getInt(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean addBook(Book book) {
        boolean isAddBook = false;
        try {
            String sql = "INSERT INTO books(name, auth, description, price, category, status, image) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book.getName());
            ps.setString(2, book.getAuth());
            ps.setString(3, book.getDescription());
            ps.setString(4, book.getPrice());
            ps.setString(5, book.getCategory());
            ps.setString(6, book.getStatus());
            ps.setString(7, book.getImage());

            if( ps.executeUpdate()==1) {
                isAddBook = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isAddBook;
    }

    @Override
    public List<Book> showBook() {
        Book book = null;
        List<Book> list = new ArrayList<Book>();
        try {
            String sql = "SELECT * FROM books";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new Book();
                book.setId(rs.getInt(1));
                book.setName(rs.getString(2));
                book.setAuth(rs.getString(3));
                book.setDescription(rs.getString(4));
                book.setPrice(rs.getString(5));
                book.setCategory(rs.getString(6));
                book.setStatus(rs.getString(7));
                book.setImage(rs.getString(8));
                list.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

	@Override
	public Book getBookId(int id) {
		Book book = null;
		try {
            String sql = "SELECT * FROM books WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1 ,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new Book();
                book.setId(rs.getInt(1));
                book.setName(rs.getString(2));
                book.setAuth(rs.getString(3));
                book.setDescription(rs.getString(4));
                book.setPrice(rs.getString(5));
                book.setCategory(rs.getString(6));
                book.setStatus(rs.getString(7));
                book.setImage(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return book;
	}

	@Override
	public boolean editBook(Book book) {
		boolean isEditBook = false;
        try {
            String sql = "UPDATE books SET name=?,auth=?,description=?,price=?,category=?,status=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book.getName());
            ps.setString(2, book.getAuth());
            ps.setString(3, book.getDescription());
            ps.setString(4, book.getPrice());
            ps.setString(5, book.getCategory());
            ps.setString(6, book.getStatus());
            ps.setInt(7, book.getId());

            if( ps.executeUpdate()==1) {
            	isEditBook = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isEditBook;
	}

	@Override
	public boolean deleteBook(int id) {
		boolean isDeleteBook = false;
        try {
            String sql = "DELETE FROM books WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            if( ps.executeUpdate()==1) {
            	isDeleteBook = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isDeleteBook;
	}

	@Override
	public boolean addCart(Cart cart) {
		 boolean isAddCart = false;
	        try {
	            String sql = "INSERT INTO cart(book_id, book_name, auth, price, user_id, total_price,image) VALUES (?,?,?,?,?,?,?)";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, cart.getBook_id());
	            ps.setString(2, cart.getBook_name());
	            ps.setString(3, cart.getAuth());
	            ps.setString(4, cart.getPrice());
	            ps.setInt(5, cart.getUser_id());
	            ps.setString(6, cart.getTotal_price());
	            ps.setString(7, cart.getImage());
	            if( ps.executeUpdate()==1) {
	            	isAddCart = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return isAddCart;
	}

	@Override
	public List<Cart> getBookCart(int user_id) {
		Cart cart = null;
		List<Cart> list = new ArrayList<Cart>();
		int total_price = 0;
		try {
            String sql = "SELECT * FROM cart WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1 ,user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	cart = new Cart();
            	cart.setId(rs.getInt(1));
            	cart.setBook_id(rs.getInt(2));
            	cart.setBook_name(rs.getString(3));
            	cart.setAuth(rs.getString(4));
                cart.setPrice(rs.getString(5));
                cart.setUser_id(rs.getInt(6));
                cart.setTotal_price(rs.getString(7));
                cart.setImage(rs.getString(8));
                list.add(cart);       
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return list;
	}

	@Override
	public boolean deleteBookFromCart(int book_id) {
		boolean isDeleteBookFromCart = false;
        try {
            String sql = "DELETE FROM cart WHERE book_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, book_id);

            if( ps.executeUpdate()==1) {
            	isDeleteBookFromCart = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isDeleteBookFromCart;
	}
}
