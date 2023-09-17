package Dao;

import java.util.List;

import Model.Cart;

public interface CartDao {
		public boolean addCart(Cart cart);
		public List<Cart> getBookCart(int user_id);
		public boolean deleteBookFromCart(int book_id);
}
