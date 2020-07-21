# PHP技术细节

##### 1.foreach循环需要修改值

> ```php
> foreach (array_expression as $value)
>     statement
> foreach (array_expression as $key => $value)
>     statement
> ```
>
> 第一种格式遍历给定的 *array_expression* 数组。每次循环中，当前单元的值被赋给 *$value* 并且数组内部的指针向前移一步（因此下一次循环中将会得到下一个单元）。
>
> 第二种格式做同样的事，只除了当前单元的键名也会在每次循环中被赋给变量 *$key*。

默认取出的值时拷贝一个值

通过在 *$value* 之前加上 & 来修改数组的元素。此方法将以引用赋值而不是拷贝一个值

##### 2.测试时模拟数据库数据

使用factory

##### 3.error：Call to a member function toArray() on null

调用toArray方法的对象不能为null，可以为空

这里注意get()和first()的区别

* get()如果没有取得值，则返回空集合
* first()如果没有取得值，则返回null

##### 4.新建model的参数

> $table		表名
>
> $primaryKey		主键
>
> $incrementing		使用非递增或非数字的主键
>
> $keyType		主键类型
>
> $timestamps		是否自动管理created_at和updated_at
>
> $dateFormat		日期属性在数据库的存储方式
>
> $connection		使用你的应用程序配置的默认数据库连接
>
> $attributes		定义默认值

##### 5.shouldReceive方法

shouldReceive只能使用静态类调用