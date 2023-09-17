package Model;

public class Cart {
	private int id;
    private  int book_id;
    private String book_name;
    private String auth;
    private String price;
    private int user_id;
    private String total_price;
    private String image;
	public Cart() {
		super();
	}
	public Cart(int id, int book_id, String book_name, String auth, String price, int user_id, String total_price,
			String image) {
		super();
		this.id = id;
		this.book_id = book_id;
		this.book_name = book_name;
		this.auth = auth;
		this.price = price;
		this.user_id = user_id;
		this.total_price = total_price;
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
