INSERT INTO authors (author_name) VALUES
                                      ('J.K. Rowling'),
                                      ('George R.R. Martin');

INSERT INTO genres (genre_name) VALUES
                                    ('Fantasy'),
                                    ('Science Fiction');

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
                                                                     ('Harry Potter and the Philosopher''s Stone', 1997, 1, 1),
                                                                     ('A Game of Thrones', 1996, 2, 1);

INSERT INTO users (username, email) VALUES
                                        ('john_doe', 'john.doe@example.com'),
                                        ('jane_smith', 'jane.smith@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
                                                                            (1, 1, '2024-11-01', '2024-11-15'),
                                                                            (2, 2, '2024-11-02', NULL);
