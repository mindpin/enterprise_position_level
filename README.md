# EnterprisePositionLevel

岗位和级别

## 引入方式

增加到 Gemfile

```ruby
gem 'enterprise_position_level',
  github: "https://github.com/mindpin/enterprise_position_level.git",
  branch: "master"
```


## 使用说明

### 创建岗位
```ruby
post = EnterprisePositionLevel::Post.create(name: "岗位1", number: "1")
```

### 设置岗位
```ruby
user = User.find user_id
post = EnterprisePositionLevel::Post.find post_id

# 给用户增加岗位
user.enterprise_position_level.enterprise_posts << post

# 给用户去掉岗位
user.enterprise_position_level.enterprise_posts.destroy(post)
```

### 创建级别
```ruby
level = EnterprisePositionLevel::Level.create(name: "级别1", number: "1")
```

### 设置级别
```ruby
user = User.find user_id
level = EnterprisePositionLevel::Level.find level_id

# 给用户设置级别
user.enterprise_position_level.set_enterprise_level level

# 给用户去掉级别
user.enterprise_position_level.set_enterprise_level nil
```
