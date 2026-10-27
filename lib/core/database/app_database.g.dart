// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isGuestMeta = const VerificationMeta(
    'isGuest',
  );
  @override
  late final GeneratedColumn<bool> isGuest = GeneratedColumn<bool>(
    'is_guest',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_guest" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastLoginAtMeta = const VerificationMeta(
    'lastLoginAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastLoginAt = GeneratedColumn<DateTime>(
    'last_login_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    email,
    displayName,
    isGuest,
    createdAt,
    lastLoginAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('is_guest')) {
      context.handle(
        _isGuestMeta,
        isGuest.isAcceptableOrUnknown(data['is_guest']!, _isGuestMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_login_at')) {
      context.handle(
        _lastLoginAtMeta,
        lastLoginAt.isAcceptableOrUnknown(
          data['last_login_at']!,
          _lastLoginAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastLoginAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      isGuest: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_guest'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastLoginAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_login_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String email;
  final String displayName;
  final bool isGuest;
  final DateTime createdAt;
  final DateTime lastLoginAt;
  final DateTime updatedAt;
  const User({
    required this.id,
    required this.email,
    required this.displayName,
    required this.isGuest,
    required this.createdAt,
    required this.lastLoginAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    map['display_name'] = Variable<String>(displayName);
    map['is_guest'] = Variable<bool>(isGuest);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['last_login_at'] = Variable<DateTime>(lastLoginAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email: Value(email),
      displayName: Value(displayName),
      isGuest: Value(isGuest),
      createdAt: Value(createdAt),
      lastLoginAt: Value(lastLoginAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      displayName: serializer.fromJson<String>(json['displayName']),
      isGuest: serializer.fromJson<bool>(json['isGuest']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastLoginAt: serializer.fromJson<DateTime>(json['lastLoginAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'displayName': serializer.toJson<String>(displayName),
      'isGuest': serializer.toJson<bool>(isGuest),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastLoginAt': serializer.toJson<DateTime>(lastLoginAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? displayName,
    bool? isGuest,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    DateTime? updatedAt,
  }) => User(
    id: id ?? this.id,
    email: email ?? this.email,
    displayName: displayName ?? this.displayName,
    isGuest: isGuest ?? this.isGuest,
    createdAt: createdAt ?? this.createdAt,
    lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      isGuest: data.isGuest.present ? data.isGuest.value : this.isGuest,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastLoginAt: data.lastLoginAt.present
          ? data.lastLoginAt.value
          : this.lastLoginAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('isGuest: $isGuest, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastLoginAt: $lastLoginAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    email,
    displayName,
    isGuest,
    createdAt,
    lastLoginAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.isGuest == this.isGuest &&
          other.createdAt == this.createdAt &&
          other.lastLoginAt == this.lastLoginAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> email;
  final Value<String> displayName;
  final Value<bool> isGuest;
  final Value<DateTime> createdAt;
  final Value<DateTime> lastLoginAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.isGuest = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String email,
    required String displayName,
    this.isGuest = const Value.absent(),
    required DateTime createdAt,
    required DateTime lastLoginAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       email = Value(email),
       displayName = Value(displayName),
       createdAt = Value(createdAt),
       lastLoginAt = Value(lastLoginAt),
       updatedAt = Value(updatedAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<bool>? isGuest,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastLoginAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (isGuest != null) 'is_guest': isGuest,
      if (createdAt != null) 'created_at': createdAt,
      if (lastLoginAt != null) 'last_login_at': lastLoginAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? email,
    Value<String>? displayName,
    Value<bool>? isGuest,
    Value<DateTime>? createdAt,
    Value<DateTime>? lastLoginAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      isGuest: isGuest ?? this.isGuest,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (isGuest.present) {
      map['is_guest'] = Variable<bool>(isGuest.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastLoginAt.present) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('isGuest: $isGuest, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastLoginAt: $lastLoginAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    description,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final String id;
  final String code;
  final String name;
  final String description;
  final int orderIndex;
  const Subject({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      description: Value(description),
      orderIndex: Value(orderIndex),
    );
  }

  factory Subject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  Subject copyWith({
    String? id,
    String? code,
    String? name,
    String? description,
    int? orderIndex,
  }) => Subject(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description ?? this.description,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, description, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.orderIndex == this.orderIndex);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> description;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectsCompanion.insert({
    required String id,
    required String code,
    required String name,
    required String description,
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       description = Value(description);
  static Insertable<Subject> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? description,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return SubjectsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, Unit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitNumberMeta = const VerificationMeta(
    'unitNumber',
  );
  @override
  late final GeneratedColumn<int> unitNumber = GeneratedColumn<int>(
    'unit_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightageQuestionsMeta =
      const VerificationMeta('weightageQuestions');
  @override
  late final GeneratedColumn<int> weightageQuestions = GeneratedColumn<int>(
    'weightage_questions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    unitNumber,
    code,
    title,
    description,
    weightageQuestions,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'units';
  @override
  VerificationContext validateIntegrity(
    Insertable<Unit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('unit_number')) {
      context.handle(
        _unitNumberMeta,
        unitNumber.isAcceptableOrUnknown(data['unit_number']!, _unitNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_unitNumberMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('weightage_questions')) {
      context.handle(
        _weightageQuestionsMeta,
        weightageQuestions.isAcceptableOrUnknown(
          data['weightage_questions']!,
          _weightageQuestionsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Unit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Unit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      unitNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_number'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      weightageQuestions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weightage_questions'],
      )!,
    );
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(attachedDatabase, alias);
  }
}

class Unit extends DataClass implements Insertable<Unit> {
  final String id;
  final String subjectId;
  final int unitNumber;
  final String code;
  final String title;
  final String description;
  final int weightageQuestions;
  const Unit({
    required this.id,
    required this.subjectId,
    required this.unitNumber,
    required this.code,
    required this.title,
    required this.description,
    required this.weightageQuestions,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_id'] = Variable<String>(subjectId);
    map['unit_number'] = Variable<int>(unitNumber);
    map['code'] = Variable<String>(code);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['weightage_questions'] = Variable<int>(weightageQuestions);
    return map;
  }

  UnitsCompanion toCompanion(bool nullToAbsent) {
    return UnitsCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      unitNumber: Value(unitNumber),
      code: Value(code),
      title: Value(title),
      description: Value(description),
      weightageQuestions: Value(weightageQuestions),
    );
  }

  factory Unit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Unit(
      id: serializer.fromJson<String>(json['id']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      unitNumber: serializer.fromJson<int>(json['unitNumber']),
      code: serializer.fromJson<String>(json['code']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      weightageQuestions: serializer.fromJson<int>(json['weightageQuestions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subjectId': serializer.toJson<String>(subjectId),
      'unitNumber': serializer.toJson<int>(unitNumber),
      'code': serializer.toJson<String>(code),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'weightageQuestions': serializer.toJson<int>(weightageQuestions),
    };
  }

  Unit copyWith({
    String? id,
    String? subjectId,
    int? unitNumber,
    String? code,
    String? title,
    String? description,
    int? weightageQuestions,
  }) => Unit(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    unitNumber: unitNumber ?? this.unitNumber,
    code: code ?? this.code,
    title: title ?? this.title,
    description: description ?? this.description,
    weightageQuestions: weightageQuestions ?? this.weightageQuestions,
  );
  Unit copyWithCompanion(UnitsCompanion data) {
    return Unit(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      unitNumber: data.unitNumber.present
          ? data.unitNumber.value
          : this.unitNumber,
      code: data.code.present ? data.code.value : this.code,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      weightageQuestions: data.weightageQuestions.present
          ? data.weightageQuestions.value
          : this.weightageQuestions,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Unit(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('unitNumber: $unitNumber, ')
          ..write('code: $code, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('weightageQuestions: $weightageQuestions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectId,
    unitNumber,
    code,
    title,
    description,
    weightageQuestions,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Unit &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.unitNumber == this.unitNumber &&
          other.code == this.code &&
          other.title == this.title &&
          other.description == this.description &&
          other.weightageQuestions == this.weightageQuestions);
}

class UnitsCompanion extends UpdateCompanion<Unit> {
  final Value<String> id;
  final Value<String> subjectId;
  final Value<int> unitNumber;
  final Value<String> code;
  final Value<String> title;
  final Value<String> description;
  final Value<int> weightageQuestions;
  final Value<int> rowid;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.unitNumber = const Value.absent(),
    this.code = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.weightageQuestions = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnitsCompanion.insert({
    required String id,
    required String subjectId,
    required int unitNumber,
    required String code,
    required String title,
    required String description,
    this.weightageQuestions = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       subjectId = Value(subjectId),
       unitNumber = Value(unitNumber),
       code = Value(code),
       title = Value(title),
       description = Value(description);
  static Insertable<Unit> custom({
    Expression<String>? id,
    Expression<String>? subjectId,
    Expression<int>? unitNumber,
    Expression<String>? code,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? weightageQuestions,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (unitNumber != null) 'unit_number': unitNumber,
      if (code != null) 'code': code,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (weightageQuestions != null) 'weightage_questions': weightageQuestions,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnitsCompanion copyWith({
    Value<String>? id,
    Value<String>? subjectId,
    Value<int>? unitNumber,
    Value<String>? code,
    Value<String>? title,
    Value<String>? description,
    Value<int>? weightageQuestions,
    Value<int>? rowid,
  }) {
    return UnitsCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      unitNumber: unitNumber ?? this.unitNumber,
      code: code ?? this.code,
      title: title ?? this.title,
      description: description ?? this.description,
      weightageQuestions: weightageQuestions ?? this.weightageQuestions,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (unitNumber.present) {
      map['unit_number'] = Variable<int>(unitNumber.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (weightageQuestions.present) {
      map['weightage_questions'] = Variable<int>(weightageQuestions.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('unitNumber: $unitNumber, ')
          ..write('code: $code, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('weightageQuestions: $weightageQuestions, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TopicsTable extends Topics with TableInfo<$TopicsTable, Topic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicNumberMeta = const VerificationMeta(
    'topicNumber',
  );
  @override
  late final GeneratedColumn<String> topicNumber = GeneratedColumn<String>(
    'topic_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, unitId, topicNumber, code, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topics';
  @override
  VerificationContext validateIntegrity(
    Insertable<Topic> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('topic_number')) {
      context.handle(
        _topicNumberMeta,
        topicNumber.isAcceptableOrUnknown(
          data['topic_number']!,
          _topicNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_topicNumberMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Topic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Topic(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      topicNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_number'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
    );
  }

  @override
  $TopicsTable createAlias(String alias) {
    return $TopicsTable(attachedDatabase, alias);
  }
}

class Topic extends DataClass implements Insertable<Topic> {
  final String id;
  final String unitId;
  final String topicNumber;
  final String code;
  final String title;
  const Topic({
    required this.id,
    required this.unitId,
    required this.topicNumber,
    required this.code,
    required this.title,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['unit_id'] = Variable<String>(unitId);
    map['topic_number'] = Variable<String>(topicNumber);
    map['code'] = Variable<String>(code);
    map['title'] = Variable<String>(title);
    return map;
  }

  TopicsCompanion toCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: Value(id),
      unitId: Value(unitId),
      topicNumber: Value(topicNumber),
      code: Value(code),
      title: Value(title),
    );
  }

  factory Topic.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Topic(
      id: serializer.fromJson<String>(json['id']),
      unitId: serializer.fromJson<String>(json['unitId']),
      topicNumber: serializer.fromJson<String>(json['topicNumber']),
      code: serializer.fromJson<String>(json['code']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'unitId': serializer.toJson<String>(unitId),
      'topicNumber': serializer.toJson<String>(topicNumber),
      'code': serializer.toJson<String>(code),
      'title': serializer.toJson<String>(title),
    };
  }

  Topic copyWith({
    String? id,
    String? unitId,
    String? topicNumber,
    String? code,
    String? title,
  }) => Topic(
    id: id ?? this.id,
    unitId: unitId ?? this.unitId,
    topicNumber: topicNumber ?? this.topicNumber,
    code: code ?? this.code,
    title: title ?? this.title,
  );
  Topic copyWithCompanion(TopicsCompanion data) {
    return Topic(
      id: data.id.present ? data.id.value : this.id,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      topicNumber: data.topicNumber.present
          ? data.topicNumber.value
          : this.topicNumber,
      code: data.code.present ? data.code.value : this.code,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Topic(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('topicNumber: $topicNumber, ')
          ..write('code: $code, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, unitId, topicNumber, code, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Topic &&
          other.id == this.id &&
          other.unitId == this.unitId &&
          other.topicNumber == this.topicNumber &&
          other.code == this.code &&
          other.title == this.title);
}

class TopicsCompanion extends UpdateCompanion<Topic> {
  final Value<String> id;
  final Value<String> unitId;
  final Value<String> topicNumber;
  final Value<String> code;
  final Value<String> title;
  final Value<int> rowid;
  const TopicsCompanion({
    this.id = const Value.absent(),
    this.unitId = const Value.absent(),
    this.topicNumber = const Value.absent(),
    this.code = const Value.absent(),
    this.title = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicsCompanion.insert({
    required String id,
    required String unitId,
    required String topicNumber,
    required String code,
    required String title,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       unitId = Value(unitId),
       topicNumber = Value(topicNumber),
       code = Value(code),
       title = Value(title);
  static Insertable<Topic> custom({
    Expression<String>? id,
    Expression<String>? unitId,
    Expression<String>? topicNumber,
    Expression<String>? code,
    Expression<String>? title,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unitId != null) 'unit_id': unitId,
      if (topicNumber != null) 'topic_number': topicNumber,
      if (code != null) 'code': code,
      if (title != null) 'title': title,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicsCompanion copyWith({
    Value<String>? id,
    Value<String>? unitId,
    Value<String>? topicNumber,
    Value<String>? code,
    Value<String>? title,
    Value<int>? rowid,
  }) {
    return TopicsCompanion(
      id: id ?? this.id,
      unitId: unitId ?? this.unitId,
      topicNumber: topicNumber ?? this.topicNumber,
      code: code ?? this.code,
      title: title ?? this.title,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (topicNumber.present) {
      map['topic_number'] = Variable<String>(topicNumber.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicsCompanion(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('topicNumber: $topicNumber, ')
          ..write('code: $code, ')
          ..write('title: $title, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
    'topic_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estimatedReadMinutesMeta =
      const VerificationMeta('estimatedReadMinutes');
  @override
  late final GeneratedColumn<int> estimatedReadMinutes = GeneratedColumn<int>(
    'estimated_read_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isBookmarkedMeta = const VerificationMeta(
    'isBookmarked',
  );
  @override
  late final GeneratedColumn<bool> isBookmarked = GeneratedColumn<bool>(
    'is_bookmarked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bookmarked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    unitId,
    topicId,
    title,
    filePath,
    estimatedReadMinutes,
    isCompleted,
    isBookmarked,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Note> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('estimated_read_minutes')) {
      context.handle(
        _estimatedReadMinutesMeta,
        estimatedReadMinutes.isAcceptableOrUnknown(
          data['estimated_read_minutes']!,
          _estimatedReadMinutesMeta,
        ),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
        _isBookmarkedMeta,
        isBookmarked.isAcceptableOrUnknown(
          data['is_bookmarked']!,
          _isBookmarkedMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      estimatedReadMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_read_minutes'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      isBookmarked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_bookmarked'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final String id;
  final String unitId;
  final String topicId;
  final String title;
  final String filePath;
  final int estimatedReadMinutes;
  final bool isCompleted;
  final bool isBookmarked;
  final DateTime updatedAt;
  const Note({
    required this.id,
    required this.unitId,
    required this.topicId,
    required this.title,
    required this.filePath,
    required this.estimatedReadMinutes,
    required this.isCompleted,
    required this.isBookmarked,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['unit_id'] = Variable<String>(unitId);
    map['topic_id'] = Variable<String>(topicId);
    map['title'] = Variable<String>(title);
    map['file_path'] = Variable<String>(filePath);
    map['estimated_read_minutes'] = Variable<int>(estimatedReadMinutes);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      unitId: Value(unitId),
      topicId: Value(topicId),
      title: Value(title),
      filePath: Value(filePath),
      estimatedReadMinutes: Value(estimatedReadMinutes),
      isCompleted: Value(isCompleted),
      isBookmarked: Value(isBookmarked),
      updatedAt: Value(updatedAt),
    );
  }

  factory Note.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<String>(json['id']),
      unitId: serializer.fromJson<String>(json['unitId']),
      topicId: serializer.fromJson<String>(json['topicId']),
      title: serializer.fromJson<String>(json['title']),
      filePath: serializer.fromJson<String>(json['filePath']),
      estimatedReadMinutes: serializer.fromJson<int>(
        json['estimatedReadMinutes'],
      ),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'unitId': serializer.toJson<String>(unitId),
      'topicId': serializer.toJson<String>(topicId),
      'title': serializer.toJson<String>(title),
      'filePath': serializer.toJson<String>(filePath),
      'estimatedReadMinutes': serializer.toJson<int>(estimatedReadMinutes),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Note copyWith({
    String? id,
    String? unitId,
    String? topicId,
    String? title,
    String? filePath,
    int? estimatedReadMinutes,
    bool? isCompleted,
    bool? isBookmarked,
    DateTime? updatedAt,
  }) => Note(
    id: id ?? this.id,
    unitId: unitId ?? this.unitId,
    topicId: topicId ?? this.topicId,
    title: title ?? this.title,
    filePath: filePath ?? this.filePath,
    estimatedReadMinutes: estimatedReadMinutes ?? this.estimatedReadMinutes,
    isCompleted: isCompleted ?? this.isCompleted,
    isBookmarked: isBookmarked ?? this.isBookmarked,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      title: data.title.present ? data.title.value : this.title,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      estimatedReadMinutes: data.estimatedReadMinutes.present
          ? data.estimatedReadMinutes.value
          : this.estimatedReadMinutes,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      isBookmarked: data.isBookmarked.present
          ? data.isBookmarked.value
          : this.isBookmarked,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('topicId: $topicId, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('estimatedReadMinutes: $estimatedReadMinutes, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    unitId,
    topicId,
    title,
    filePath,
    estimatedReadMinutes,
    isCompleted,
    isBookmarked,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.unitId == this.unitId &&
          other.topicId == this.topicId &&
          other.title == this.title &&
          other.filePath == this.filePath &&
          other.estimatedReadMinutes == this.estimatedReadMinutes &&
          other.isCompleted == this.isCompleted &&
          other.isBookmarked == this.isBookmarked &&
          other.updatedAt == this.updatedAt);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> id;
  final Value<String> unitId;
  final Value<String> topicId;
  final Value<String> title;
  final Value<String> filePath;
  final Value<int> estimatedReadMinutes;
  final Value<bool> isCompleted;
  final Value<bool> isBookmarked;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.unitId = const Value.absent(),
    this.topicId = const Value.absent(),
    this.title = const Value.absent(),
    this.filePath = const Value.absent(),
    this.estimatedReadMinutes = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String id,
    required String unitId,
    required String topicId,
    required String title,
    required String filePath,
    this.estimatedReadMinutes = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       unitId = Value(unitId),
       topicId = Value(topicId),
       title = Value(title),
       filePath = Value(filePath),
       updatedAt = Value(updatedAt);
  static Insertable<Note> custom({
    Expression<String>? id,
    Expression<String>? unitId,
    Expression<String>? topicId,
    Expression<String>? title,
    Expression<String>? filePath,
    Expression<int>? estimatedReadMinutes,
    Expression<bool>? isCompleted,
    Expression<bool>? isBookmarked,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unitId != null) 'unit_id': unitId,
      if (topicId != null) 'topic_id': topicId,
      if (title != null) 'title': title,
      if (filePath != null) 'file_path': filePath,
      if (estimatedReadMinutes != null)
        'estimated_read_minutes': estimatedReadMinutes,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith({
    Value<String>? id,
    Value<String>? unitId,
    Value<String>? topicId,
    Value<String>? title,
    Value<String>? filePath,
    Value<int>? estimatedReadMinutes,
    Value<bool>? isCompleted,
    Value<bool>? isBookmarked,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return NotesCompanion(
      id: id ?? this.id,
      unitId: unitId ?? this.unitId,
      topicId: topicId ?? this.topicId,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
      estimatedReadMinutes: estimatedReadMinutes ?? this.estimatedReadMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (estimatedReadMinutes.present) {
      map['estimated_read_minutes'] = Variable<int>(estimatedReadMinutes.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('topicId: $topicId, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('estimatedReadMinutes: $estimatedReadMinutes, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
    'topic_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionTextMeta = const VerificationMeta(
    'questionText',
  );
  @override
  late final GeneratedColumn<String> questionText = GeneratedColumn<String>(
    'question_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPyqMeta = const VerificationMeta('isPyq');
  @override
  late final GeneratedColumn<bool> isPyq = GeneratedColumn<bool>(
    'is_pyq',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pyq" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('medium'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    unitId,
    topicId,
    questionText,
    explanation,
    year,
    isPyq,
    sourceType,
    difficulty,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Question> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('question_text')) {
      context.handle(
        _questionTextMeta,
        questionText.isAcceptableOrUnknown(
          data['question_text']!,
          _questionTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_questionTextMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('is_pyq')) {
      context.handle(
        _isPyqMeta,
        isPyq.isAcceptableOrUnknown(data['is_pyq']!, _isPyqMeta),
      );
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_id'],
      )!,
      questionText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_text'],
      )!,
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      isPyq: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pyq'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final String id;
  final String unitId;
  final String topicId;
  final String questionText;
  final String explanation;
  final int? year;
  final bool isPyq;
  final String sourceType;
  final String difficulty;
  const Question({
    required this.id,
    required this.unitId,
    required this.topicId,
    required this.questionText,
    required this.explanation,
    this.year,
    required this.isPyq,
    required this.sourceType,
    required this.difficulty,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['unit_id'] = Variable<String>(unitId);
    map['topic_id'] = Variable<String>(topicId);
    map['question_text'] = Variable<String>(questionText);
    map['explanation'] = Variable<String>(explanation);
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    map['is_pyq'] = Variable<bool>(isPyq);
    map['source_type'] = Variable<String>(sourceType);
    map['difficulty'] = Variable<String>(difficulty);
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      unitId: Value(unitId),
      topicId: Value(topicId),
      questionText: Value(questionText),
      explanation: Value(explanation),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      isPyq: Value(isPyq),
      sourceType: Value(sourceType),
      difficulty: Value(difficulty),
    );
  }

  factory Question.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<String>(json['id']),
      unitId: serializer.fromJson<String>(json['unitId']),
      topicId: serializer.fromJson<String>(json['topicId']),
      questionText: serializer.fromJson<String>(json['questionText']),
      explanation: serializer.fromJson<String>(json['explanation']),
      year: serializer.fromJson<int?>(json['year']),
      isPyq: serializer.fromJson<bool>(json['isPyq']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'unitId': serializer.toJson<String>(unitId),
      'topicId': serializer.toJson<String>(topicId),
      'questionText': serializer.toJson<String>(questionText),
      'explanation': serializer.toJson<String>(explanation),
      'year': serializer.toJson<int?>(year),
      'isPyq': serializer.toJson<bool>(isPyq),
      'sourceType': serializer.toJson<String>(sourceType),
      'difficulty': serializer.toJson<String>(difficulty),
    };
  }

  Question copyWith({
    String? id,
    String? unitId,
    String? topicId,
    String? questionText,
    String? explanation,
    Value<int?> year = const Value.absent(),
    bool? isPyq,
    String? sourceType,
    String? difficulty,
  }) => Question(
    id: id ?? this.id,
    unitId: unitId ?? this.unitId,
    topicId: topicId ?? this.topicId,
    questionText: questionText ?? this.questionText,
    explanation: explanation ?? this.explanation,
    year: year.present ? year.value : this.year,
    isPyq: isPyq ?? this.isPyq,
    sourceType: sourceType ?? this.sourceType,
    difficulty: difficulty ?? this.difficulty,
  );
  Question copyWithCompanion(QuestionsCompanion data) {
    return Question(
      id: data.id.present ? data.id.value : this.id,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      questionText: data.questionText.present
          ? data.questionText.value
          : this.questionText,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      year: data.year.present ? data.year.value : this.year,
      isPyq: data.isPyq.present ? data.isPyq.value : this.isPyq,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('topicId: $topicId, ')
          ..write('questionText: $questionText, ')
          ..write('explanation: $explanation, ')
          ..write('year: $year, ')
          ..write('isPyq: $isPyq, ')
          ..write('sourceType: $sourceType, ')
          ..write('difficulty: $difficulty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    unitId,
    topicId,
    questionText,
    explanation,
    year,
    isPyq,
    sourceType,
    difficulty,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.unitId == this.unitId &&
          other.topicId == this.topicId &&
          other.questionText == this.questionText &&
          other.explanation == this.explanation &&
          other.year == this.year &&
          other.isPyq == this.isPyq &&
          other.sourceType == this.sourceType &&
          other.difficulty == this.difficulty);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<String> id;
  final Value<String> unitId;
  final Value<String> topicId;
  final Value<String> questionText;
  final Value<String> explanation;
  final Value<int?> year;
  final Value<bool> isPyq;
  final Value<String> sourceType;
  final Value<String> difficulty;
  final Value<int> rowid;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.unitId = const Value.absent(),
    this.topicId = const Value.absent(),
    this.questionText = const Value.absent(),
    this.explanation = const Value.absent(),
    this.year = const Value.absent(),
    this.isPyq = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionsCompanion.insert({
    required String id,
    required String unitId,
    required String topicId,
    required String questionText,
    required String explanation,
    this.year = const Value.absent(),
    this.isPyq = const Value.absent(),
    required String sourceType,
    this.difficulty = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       unitId = Value(unitId),
       topicId = Value(topicId),
       questionText = Value(questionText),
       explanation = Value(explanation),
       sourceType = Value(sourceType);
  static Insertable<Question> custom({
    Expression<String>? id,
    Expression<String>? unitId,
    Expression<String>? topicId,
    Expression<String>? questionText,
    Expression<String>? explanation,
    Expression<int>? year,
    Expression<bool>? isPyq,
    Expression<String>? sourceType,
    Expression<String>? difficulty,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unitId != null) 'unit_id': unitId,
      if (topicId != null) 'topic_id': topicId,
      if (questionText != null) 'question_text': questionText,
      if (explanation != null) 'explanation': explanation,
      if (year != null) 'year': year,
      if (isPyq != null) 'is_pyq': isPyq,
      if (sourceType != null) 'source_type': sourceType,
      if (difficulty != null) 'difficulty': difficulty,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionsCompanion copyWith({
    Value<String>? id,
    Value<String>? unitId,
    Value<String>? topicId,
    Value<String>? questionText,
    Value<String>? explanation,
    Value<int?>? year,
    Value<bool>? isPyq,
    Value<String>? sourceType,
    Value<String>? difficulty,
    Value<int>? rowid,
  }) {
    return QuestionsCompanion(
      id: id ?? this.id,
      unitId: unitId ?? this.unitId,
      topicId: topicId ?? this.topicId,
      questionText: questionText ?? this.questionText,
      explanation: explanation ?? this.explanation,
      year: year ?? this.year,
      isPyq: isPyq ?? this.isPyq,
      sourceType: sourceType ?? this.sourceType,
      difficulty: difficulty ?? this.difficulty,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (questionText.present) {
      map['question_text'] = Variable<String>(questionText.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (isPyq.present) {
      map['is_pyq'] = Variable<bool>(isPyq.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('topicId: $topicId, ')
          ..write('questionText: $questionText, ')
          ..write('explanation: $explanation, ')
          ..write('year: $year, ')
          ..write('isPyq: $isPyq, ')
          ..write('sourceType: $sourceType, ')
          ..write('difficulty: $difficulty, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestionOptionsTable extends QuestionOptions
    with TableInfo<$QuestionOptionsTable, QuestionOption> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionOptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _optionLetterMeta = const VerificationMeta(
    'optionLetter',
  );
  @override
  late final GeneratedColumn<String> optionLetter = GeneratedColumn<String>(
    'option_letter',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textContentMeta = const VerificationMeta(
    'textContent',
  );
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
    'text_content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCorrectMeta = const VerificationMeta(
    'isCorrect',
  );
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
    'is_correct',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_correct" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    questionId,
    optionLetter,
    textContent,
    isCorrect,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'question_options';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionOption> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('option_letter')) {
      context.handle(
        _optionLetterMeta,
        optionLetter.isAcceptableOrUnknown(
          data['option_letter']!,
          _optionLetterMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_optionLetterMeta);
    }
    if (data.containsKey('text_content')) {
      context.handle(
        _textContentMeta,
        textContent.isAcceptableOrUnknown(
          data['text_content']!,
          _textContentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_textContentMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(
        _isCorrectMeta,
        isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta),
      );
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionOption map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionOption(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      )!,
      optionLetter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}option_letter'],
      )!,
      textContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_content'],
      )!,
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      )!,
    );
  }

  @override
  $QuestionOptionsTable createAlias(String alias) {
    return $QuestionOptionsTable(attachedDatabase, alias);
  }
}

class QuestionOption extends DataClass implements Insertable<QuestionOption> {
  final String id;
  final String questionId;
  final String optionLetter;
  final String textContent;
  final bool isCorrect;
  const QuestionOption({
    required this.id,
    required this.questionId,
    required this.optionLetter,
    required this.textContent,
    required this.isCorrect,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['question_id'] = Variable<String>(questionId);
    map['option_letter'] = Variable<String>(optionLetter);
    map['text_content'] = Variable<String>(textContent);
    map['is_correct'] = Variable<bool>(isCorrect);
    return map;
  }

  QuestionOptionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionOptionsCompanion(
      id: Value(id),
      questionId: Value(questionId),
      optionLetter: Value(optionLetter),
      textContent: Value(textContent),
      isCorrect: Value(isCorrect),
    );
  }

  factory QuestionOption.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionOption(
      id: serializer.fromJson<String>(json['id']),
      questionId: serializer.fromJson<String>(json['questionId']),
      optionLetter: serializer.fromJson<String>(json['optionLetter']),
      textContent: serializer.fromJson<String>(json['textContent']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'questionId': serializer.toJson<String>(questionId),
      'optionLetter': serializer.toJson<String>(optionLetter),
      'textContent': serializer.toJson<String>(textContent),
      'isCorrect': serializer.toJson<bool>(isCorrect),
    };
  }

  QuestionOption copyWith({
    String? id,
    String? questionId,
    String? optionLetter,
    String? textContent,
    bool? isCorrect,
  }) => QuestionOption(
    id: id ?? this.id,
    questionId: questionId ?? this.questionId,
    optionLetter: optionLetter ?? this.optionLetter,
    textContent: textContent ?? this.textContent,
    isCorrect: isCorrect ?? this.isCorrect,
  );
  QuestionOption copyWithCompanion(QuestionOptionsCompanion data) {
    return QuestionOption(
      id: data.id.present ? data.id.value : this.id,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      optionLetter: data.optionLetter.present
          ? data.optionLetter.value
          : this.optionLetter,
      textContent: data.textContent.present
          ? data.textContent.value
          : this.textContent,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionOption(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('optionLetter: $optionLetter, ')
          ..write('textContent: $textContent, ')
          ..write('isCorrect: $isCorrect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, questionId, optionLetter, textContent, isCorrect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionOption &&
          other.id == this.id &&
          other.questionId == this.questionId &&
          other.optionLetter == this.optionLetter &&
          other.textContent == this.textContent &&
          other.isCorrect == this.isCorrect);
}

class QuestionOptionsCompanion extends UpdateCompanion<QuestionOption> {
  final Value<String> id;
  final Value<String> questionId;
  final Value<String> optionLetter;
  final Value<String> textContent;
  final Value<bool> isCorrect;
  final Value<int> rowid;
  const QuestionOptionsCompanion({
    this.id = const Value.absent(),
    this.questionId = const Value.absent(),
    this.optionLetter = const Value.absent(),
    this.textContent = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionOptionsCompanion.insert({
    required String id,
    required String questionId,
    required String optionLetter,
    required String textContent,
    required bool isCorrect,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       questionId = Value(questionId),
       optionLetter = Value(optionLetter),
       textContent = Value(textContent),
       isCorrect = Value(isCorrect);
  static Insertable<QuestionOption> custom({
    Expression<String>? id,
    Expression<String>? questionId,
    Expression<String>? optionLetter,
    Expression<String>? textContent,
    Expression<bool>? isCorrect,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionId != null) 'question_id': questionId,
      if (optionLetter != null) 'option_letter': optionLetter,
      if (textContent != null) 'text_content': textContent,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionOptionsCompanion copyWith({
    Value<String>? id,
    Value<String>? questionId,
    Value<String>? optionLetter,
    Value<String>? textContent,
    Value<bool>? isCorrect,
    Value<int>? rowid,
  }) {
    return QuestionOptionsCompanion(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      optionLetter: optionLetter ?? this.optionLetter,
      textContent: textContent ?? this.textContent,
      isCorrect: isCorrect ?? this.isCorrect,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (optionLetter.present) {
      map['option_letter'] = Variable<String>(optionLetter.value);
    }
    if (textContent.present) {
      map['text_content'] = Variable<String>(textContent.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionOptionsCompanion(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('optionLetter: $optionLetter, ')
          ..write('textContent: $textContent, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExamAttemptsTable extends ExamAttempts
    with TableInfo<$ExamAttemptsTable, ExamAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamAttemptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalQuestionsMeta = const VerificationMeta(
    'totalQuestions',
  );
  @override
  late final GeneratedColumn<int> totalQuestions = GeneratedColumn<int>(
    'total_questions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passedMeta = const VerificationMeta('passed');
  @override
  late final GeneratedColumn<bool> passed = GeneratedColumn<bool>(
    'passed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("passed" IN (0, 1))',
    ),
  );
  static const VerificationMeta _answersJsonMeta = const VerificationMeta(
    'answersJson',
  );
  @override
  late final GeneratedColumn<String> answersJson = GeneratedColumn<String>(
    'answers_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPyqMeta = const VerificationMeta('isPyq');
  @override
  late final GeneratedColumn<bool> isPyq = GeneratedColumn<bool>(
    'is_pyq',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pyq" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    title,
    startedAt,
    completedAt,
    durationSeconds,
    score,
    totalQuestions,
    passed,
    answersJson,
    isPyq,
    year,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam_attempts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExamAttempt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationSecondsMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('total_questions')) {
      context.handle(
        _totalQuestionsMeta,
        totalQuestions.isAcceptableOrUnknown(
          data['total_questions']!,
          _totalQuestionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalQuestionsMeta);
    }
    if (data.containsKey('passed')) {
      context.handle(
        _passedMeta,
        passed.isAcceptableOrUnknown(data['passed']!, _passedMeta),
      );
    } else if (isInserting) {
      context.missing(_passedMeta);
    }
    if (data.containsKey('answers_json')) {
      context.handle(
        _answersJsonMeta,
        answersJson.isAcceptableOrUnknown(
          data['answers_json']!,
          _answersJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_answersJsonMeta);
    }
    if (data.containsKey('is_pyq')) {
      context.handle(
        _isPyqMeta,
        isPyq.isAcceptableOrUnknown(data['is_pyq']!, _isPyqMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExamAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExamAttempt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      totalQuestions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_questions'],
      )!,
      passed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}passed'],
      )!,
      answersJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answers_json'],
      )!,
      isPyq: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pyq'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ExamAttemptsTable createAlias(String alias) {
    return $ExamAttemptsTable(attachedDatabase, alias);
  }
}

class ExamAttempt extends DataClass implements Insertable<ExamAttempt> {
  final String id;
  final String userId;
  final String title;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int durationSeconds;
  final int score;
  final int totalQuestions;
  final bool passed;
  final String answersJson;
  final bool isPyq;
  final int? year;
  final DateTime updatedAt;
  const ExamAttempt({
    required this.id,
    required this.userId,
    required this.title,
    required this.startedAt,
    this.completedAt,
    required this.durationSeconds,
    required this.score,
    required this.totalQuestions,
    required this.passed,
    required this.answersJson,
    required this.isPyq,
    this.year,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['title'] = Variable<String>(title);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['score'] = Variable<int>(score);
    map['total_questions'] = Variable<int>(totalQuestions);
    map['passed'] = Variable<bool>(passed);
    map['answers_json'] = Variable<String>(answersJson);
    map['is_pyq'] = Variable<bool>(isPyq);
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ExamAttemptsCompanion toCompanion(bool nullToAbsent) {
    return ExamAttemptsCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      durationSeconds: Value(durationSeconds),
      score: Value(score),
      totalQuestions: Value(totalQuestions),
      passed: Value(passed),
      answersJson: Value(answersJson),
      isPyq: Value(isPyq),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      updatedAt: Value(updatedAt),
    );
  }

  factory ExamAttempt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExamAttempt(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      score: serializer.fromJson<int>(json['score']),
      totalQuestions: serializer.fromJson<int>(json['totalQuestions']),
      passed: serializer.fromJson<bool>(json['passed']),
      answersJson: serializer.fromJson<String>(json['answersJson']),
      isPyq: serializer.fromJson<bool>(json['isPyq']),
      year: serializer.fromJson<int?>(json['year']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'title': serializer.toJson<String>(title),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'score': serializer.toJson<int>(score),
      'totalQuestions': serializer.toJson<int>(totalQuestions),
      'passed': serializer.toJson<bool>(passed),
      'answersJson': serializer.toJson<String>(answersJson),
      'isPyq': serializer.toJson<bool>(isPyq),
      'year': serializer.toJson<int?>(year),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ExamAttempt copyWith({
    String? id,
    String? userId,
    String? title,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    int? durationSeconds,
    int? score,
    int? totalQuestions,
    bool? passed,
    String? answersJson,
    bool? isPyq,
    Value<int?> year = const Value.absent(),
    DateTime? updatedAt,
  }) => ExamAttempt(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    score: score ?? this.score,
    totalQuestions: totalQuestions ?? this.totalQuestions,
    passed: passed ?? this.passed,
    answersJson: answersJson ?? this.answersJson,
    isPyq: isPyq ?? this.isPyq,
    year: year.present ? year.value : this.year,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ExamAttempt copyWithCompanion(ExamAttemptsCompanion data) {
    return ExamAttempt(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      score: data.score.present ? data.score.value : this.score,
      totalQuestions: data.totalQuestions.present
          ? data.totalQuestions.value
          : this.totalQuestions,
      passed: data.passed.present ? data.passed.value : this.passed,
      answersJson: data.answersJson.present
          ? data.answersJson.value
          : this.answersJson,
      isPyq: data.isPyq.present ? data.isPyq.value : this.isPyq,
      year: data.year.present ? data.year.value : this.year,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExamAttempt(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('score: $score, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('passed: $passed, ')
          ..write('answersJson: $answersJson, ')
          ..write('isPyq: $isPyq, ')
          ..write('year: $year, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    title,
    startedAt,
    completedAt,
    durationSeconds,
    score,
    totalQuestions,
    passed,
    answersJson,
    isPyq,
    year,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExamAttempt &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.durationSeconds == this.durationSeconds &&
          other.score == this.score &&
          other.totalQuestions == this.totalQuestions &&
          other.passed == this.passed &&
          other.answersJson == this.answersJson &&
          other.isPyq == this.isPyq &&
          other.year == this.year &&
          other.updatedAt == this.updatedAt);
}

class ExamAttemptsCompanion extends UpdateCompanion<ExamAttempt> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> title;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int> durationSeconds;
  final Value<int> score;
  final Value<int> totalQuestions;
  final Value<bool> passed;
  final Value<String> answersJson;
  final Value<bool> isPyq;
  final Value<int?> year;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ExamAttemptsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.score = const Value.absent(),
    this.totalQuestions = const Value.absent(),
    this.passed = const Value.absent(),
    this.answersJson = const Value.absent(),
    this.isPyq = const Value.absent(),
    this.year = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExamAttemptsCompanion.insert({
    required String id,
    required String userId,
    required String title,
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    required int durationSeconds,
    required int score,
    required int totalQuestions,
    required bool passed,
    required String answersJson,
    this.isPyq = const Value.absent(),
    this.year = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       title = Value(title),
       startedAt = Value(startedAt),
       durationSeconds = Value(durationSeconds),
       score = Value(score),
       totalQuestions = Value(totalQuestions),
       passed = Value(passed),
       answersJson = Value(answersJson),
       updatedAt = Value(updatedAt);
  static Insertable<ExamAttempt> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? title,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? durationSeconds,
    Expression<int>? score,
    Expression<int>? totalQuestions,
    Expression<bool>? passed,
    Expression<String>? answersJson,
    Expression<bool>? isPyq,
    Expression<int>? year,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (score != null) 'score': score,
      if (totalQuestions != null) 'total_questions': totalQuestions,
      if (passed != null) 'passed': passed,
      if (answersJson != null) 'answers_json': answersJson,
      if (isPyq != null) 'is_pyq': isPyq,
      if (year != null) 'year': year,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExamAttemptsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? title,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<int>? durationSeconds,
    Value<int>? score,
    Value<int>? totalQuestions,
    Value<bool>? passed,
    Value<String>? answersJson,
    Value<bool>? isPyq,
    Value<int?>? year,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ExamAttemptsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      score: score ?? this.score,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      passed: passed ?? this.passed,
      answersJson: answersJson ?? this.answersJson,
      isPyq: isPyq ?? this.isPyq,
      year: year ?? this.year,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (totalQuestions.present) {
      map['total_questions'] = Variable<int>(totalQuestions.value);
    }
    if (passed.present) {
      map['passed'] = Variable<bool>(passed.value);
    }
    if (answersJson.present) {
      map['answers_json'] = Variable<String>(answersJson.value);
    }
    if (isPyq.present) {
      map['is_pyq'] = Variable<bool>(isPyq.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamAttemptsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('score: $score, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('passed: $passed, ')
          ..write('answersJson: $answersJson, ')
          ..write('isPyq: $isPyq, ')
          ..write('year: $year, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnswerLogsTable extends AnswerLogs
    with TableInfo<$AnswerLogsTable, AnswerLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnswerLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedOptionIdMeta = const VerificationMeta(
    'selectedOptionId',
  );
  @override
  late final GeneratedColumn<String> selectedOptionId = GeneratedColumn<String>(
    'selected_option_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCorrectMeta = const VerificationMeta(
    'isCorrect',
  );
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
    'is_correct',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_correct" IN (0, 1))',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    questionId,
    selectedOptionId,
    isCorrect,
    timestamp,
    mode,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'answer_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnswerLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('selected_option_id')) {
      context.handle(
        _selectedOptionIdMeta,
        selectedOptionId.isAcceptableOrUnknown(
          data['selected_option_id']!,
          _selectedOptionIdMeta,
        ),
      );
    }
    if (data.containsKey('is_correct')) {
      context.handle(
        _isCorrectMeta,
        isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta),
      );
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnswerLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnswerLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      )!,
      selectedOptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_option_id'],
      ),
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AnswerLogsTable createAlias(String alias) {
    return $AnswerLogsTable(attachedDatabase, alias);
  }
}

class AnswerLog extends DataClass implements Insertable<AnswerLog> {
  final String id;
  final String userId;
  final String questionId;
  final String? selectedOptionId;
  final bool isCorrect;
  final DateTime timestamp;
  final String mode;
  final DateTime updatedAt;
  const AnswerLog({
    required this.id,
    required this.userId,
    required this.questionId,
    this.selectedOptionId,
    required this.isCorrect,
    required this.timestamp,
    required this.mode,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['question_id'] = Variable<String>(questionId);
    if (!nullToAbsent || selectedOptionId != null) {
      map['selected_option_id'] = Variable<String>(selectedOptionId);
    }
    map['is_correct'] = Variable<bool>(isCorrect);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['mode'] = Variable<String>(mode);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AnswerLogsCompanion toCompanion(bool nullToAbsent) {
    return AnswerLogsCompanion(
      id: Value(id),
      userId: Value(userId),
      questionId: Value(questionId),
      selectedOptionId: selectedOptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedOptionId),
      isCorrect: Value(isCorrect),
      timestamp: Value(timestamp),
      mode: Value(mode),
      updatedAt: Value(updatedAt),
    );
  }

  factory AnswerLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnswerLog(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      questionId: serializer.fromJson<String>(json['questionId']),
      selectedOptionId: serializer.fromJson<String?>(json['selectedOptionId']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      mode: serializer.fromJson<String>(json['mode']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'questionId': serializer.toJson<String>(questionId),
      'selectedOptionId': serializer.toJson<String?>(selectedOptionId),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'mode': serializer.toJson<String>(mode),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AnswerLog copyWith({
    String? id,
    String? userId,
    String? questionId,
    Value<String?> selectedOptionId = const Value.absent(),
    bool? isCorrect,
    DateTime? timestamp,
    String? mode,
    DateTime? updatedAt,
  }) => AnswerLog(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    questionId: questionId ?? this.questionId,
    selectedOptionId: selectedOptionId.present
        ? selectedOptionId.value
        : this.selectedOptionId,
    isCorrect: isCorrect ?? this.isCorrect,
    timestamp: timestamp ?? this.timestamp,
    mode: mode ?? this.mode,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AnswerLog copyWithCompanion(AnswerLogsCompanion data) {
    return AnswerLog(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      selectedOptionId: data.selectedOptionId.present
          ? data.selectedOptionId.value
          : this.selectedOptionId,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      mode: data.mode.present ? data.mode.value : this.mode,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnswerLog(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedOptionId: $selectedOptionId, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('timestamp: $timestamp, ')
          ..write('mode: $mode, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    questionId,
    selectedOptionId,
    isCorrect,
    timestamp,
    mode,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnswerLog &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.questionId == this.questionId &&
          other.selectedOptionId == this.selectedOptionId &&
          other.isCorrect == this.isCorrect &&
          other.timestamp == this.timestamp &&
          other.mode == this.mode &&
          other.updatedAt == this.updatedAt);
}

class AnswerLogsCompanion extends UpdateCompanion<AnswerLog> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> questionId;
  final Value<String?> selectedOptionId;
  final Value<bool> isCorrect;
  final Value<DateTime> timestamp;
  final Value<String> mode;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AnswerLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.selectedOptionId = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.mode = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnswerLogsCompanion.insert({
    required String id,
    required String userId,
    required String questionId,
    this.selectedOptionId = const Value.absent(),
    required bool isCorrect,
    required DateTime timestamp,
    required String mode,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       questionId = Value(questionId),
       isCorrect = Value(isCorrect),
       timestamp = Value(timestamp),
       mode = Value(mode),
       updatedAt = Value(updatedAt);
  static Insertable<AnswerLog> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? questionId,
    Expression<String>? selectedOptionId,
    Expression<bool>? isCorrect,
    Expression<DateTime>? timestamp,
    Expression<String>? mode,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (questionId != null) 'question_id': questionId,
      if (selectedOptionId != null) 'selected_option_id': selectedOptionId,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (timestamp != null) 'timestamp': timestamp,
      if (mode != null) 'mode': mode,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnswerLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? questionId,
    Value<String?>? selectedOptionId,
    Value<bool>? isCorrect,
    Value<DateTime>? timestamp,
    Value<String>? mode,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AnswerLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      questionId: questionId ?? this.questionId,
      selectedOptionId: selectedOptionId ?? this.selectedOptionId,
      isCorrect: isCorrect ?? this.isCorrect,
      timestamp: timestamp ?? this.timestamp,
      mode: mode ?? this.mode,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (selectedOptionId.present) {
      map['selected_option_id'] = Variable<String>(selectedOptionId.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnswerLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedOptionId: $selectedOptionId, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('timestamp: $timestamp, ')
          ..write('mode: $mode, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgressTableTable extends ProgressTable
    with TableInfo<$ProgressTableTable, ProgressTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgressTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesReadCountMeta = const VerificationMeta(
    'notesReadCount',
  );
  @override
  late final GeneratedColumn<int> notesReadCount = GeneratedColumn<int>(
    'notes_read_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _questionsAttemptedMeta =
      const VerificationMeta('questionsAttempted');
  @override
  late final GeneratedColumn<int> questionsAttempted = GeneratedColumn<int>(
    'questions_attempted',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _questionsCorrectMeta = const VerificationMeta(
    'questionsCorrect',
  );
  @override
  late final GeneratedColumn<int> questionsCorrect = GeneratedColumn<int>(
    'questions_correct',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastStudiedAtMeta = const VerificationMeta(
    'lastStudiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastStudiedAt =
      GeneratedColumn<DateTime>(
        'last_studied_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    unitId,
    notesReadCount,
    questionsAttempted,
    questionsCorrect,
    lastStudiedAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'progress_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgressTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('notes_read_count')) {
      context.handle(
        _notesReadCountMeta,
        notesReadCount.isAcceptableOrUnknown(
          data['notes_read_count']!,
          _notesReadCountMeta,
        ),
      );
    }
    if (data.containsKey('questions_attempted')) {
      context.handle(
        _questionsAttemptedMeta,
        questionsAttempted.isAcceptableOrUnknown(
          data['questions_attempted']!,
          _questionsAttemptedMeta,
        ),
      );
    }
    if (data.containsKey('questions_correct')) {
      context.handle(
        _questionsCorrectMeta,
        questionsCorrect.isAcceptableOrUnknown(
          data['questions_correct']!,
          _questionsCorrectMeta,
        ),
      );
    }
    if (data.containsKey('last_studied_at')) {
      context.handle(
        _lastStudiedAtMeta,
        lastStudiedAt.isAcceptableOrUnknown(
          data['last_studied_at']!,
          _lastStudiedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastStudiedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgressTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgressTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      notesReadCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notes_read_count'],
      )!,
      questionsAttempted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}questions_attempted'],
      )!,
      questionsCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}questions_correct'],
      )!,
      lastStudiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_studied_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProgressTableTable createAlias(String alias) {
    return $ProgressTableTable(attachedDatabase, alias);
  }
}

class ProgressTableData extends DataClass
    implements Insertable<ProgressTableData> {
  final String id;
  final String userId;
  final String unitId;
  final int notesReadCount;
  final int questionsAttempted;
  final int questionsCorrect;
  final DateTime lastStudiedAt;
  final DateTime updatedAt;
  const ProgressTableData({
    required this.id,
    required this.userId,
    required this.unitId,
    required this.notesReadCount,
    required this.questionsAttempted,
    required this.questionsCorrect,
    required this.lastStudiedAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['unit_id'] = Variable<String>(unitId);
    map['notes_read_count'] = Variable<int>(notesReadCount);
    map['questions_attempted'] = Variable<int>(questionsAttempted);
    map['questions_correct'] = Variable<int>(questionsCorrect);
    map['last_studied_at'] = Variable<DateTime>(lastStudiedAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProgressTableCompanion toCompanion(bool nullToAbsent) {
    return ProgressTableCompanion(
      id: Value(id),
      userId: Value(userId),
      unitId: Value(unitId),
      notesReadCount: Value(notesReadCount),
      questionsAttempted: Value(questionsAttempted),
      questionsCorrect: Value(questionsCorrect),
      lastStudiedAt: Value(lastStudiedAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProgressTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgressTableData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      unitId: serializer.fromJson<String>(json['unitId']),
      notesReadCount: serializer.fromJson<int>(json['notesReadCount']),
      questionsAttempted: serializer.fromJson<int>(json['questionsAttempted']),
      questionsCorrect: serializer.fromJson<int>(json['questionsCorrect']),
      lastStudiedAt: serializer.fromJson<DateTime>(json['lastStudiedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'unitId': serializer.toJson<String>(unitId),
      'notesReadCount': serializer.toJson<int>(notesReadCount),
      'questionsAttempted': serializer.toJson<int>(questionsAttempted),
      'questionsCorrect': serializer.toJson<int>(questionsCorrect),
      'lastStudiedAt': serializer.toJson<DateTime>(lastStudiedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProgressTableData copyWith({
    String? id,
    String? userId,
    String? unitId,
    int? notesReadCount,
    int? questionsAttempted,
    int? questionsCorrect,
    DateTime? lastStudiedAt,
    DateTime? updatedAt,
  }) => ProgressTableData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    unitId: unitId ?? this.unitId,
    notesReadCount: notesReadCount ?? this.notesReadCount,
    questionsAttempted: questionsAttempted ?? this.questionsAttempted,
    questionsCorrect: questionsCorrect ?? this.questionsCorrect,
    lastStudiedAt: lastStudiedAt ?? this.lastStudiedAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ProgressTableData copyWithCompanion(ProgressTableCompanion data) {
    return ProgressTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      notesReadCount: data.notesReadCount.present
          ? data.notesReadCount.value
          : this.notesReadCount,
      questionsAttempted: data.questionsAttempted.present
          ? data.questionsAttempted.value
          : this.questionsAttempted,
      questionsCorrect: data.questionsCorrect.present
          ? data.questionsCorrect.value
          : this.questionsCorrect,
      lastStudiedAt: data.lastStudiedAt.present
          ? data.lastStudiedAt.value
          : this.lastStudiedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgressTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('unitId: $unitId, ')
          ..write('notesReadCount: $notesReadCount, ')
          ..write('questionsAttempted: $questionsAttempted, ')
          ..write('questionsCorrect: $questionsCorrect, ')
          ..write('lastStudiedAt: $lastStudiedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    unitId,
    notesReadCount,
    questionsAttempted,
    questionsCorrect,
    lastStudiedAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgressTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.unitId == this.unitId &&
          other.notesReadCount == this.notesReadCount &&
          other.questionsAttempted == this.questionsAttempted &&
          other.questionsCorrect == this.questionsCorrect &&
          other.lastStudiedAt == this.lastStudiedAt &&
          other.updatedAt == this.updatedAt);
}

class ProgressTableCompanion extends UpdateCompanion<ProgressTableData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> unitId;
  final Value<int> notesReadCount;
  final Value<int> questionsAttempted;
  final Value<int> questionsCorrect;
  final Value<DateTime> lastStudiedAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ProgressTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.notesReadCount = const Value.absent(),
    this.questionsAttempted = const Value.absent(),
    this.questionsCorrect = const Value.absent(),
    this.lastStudiedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgressTableCompanion.insert({
    required String id,
    required String userId,
    required String unitId,
    this.notesReadCount = const Value.absent(),
    this.questionsAttempted = const Value.absent(),
    this.questionsCorrect = const Value.absent(),
    required DateTime lastStudiedAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       unitId = Value(unitId),
       lastStudiedAt = Value(lastStudiedAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProgressTableData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? unitId,
    Expression<int>? notesReadCount,
    Expression<int>? questionsAttempted,
    Expression<int>? questionsCorrect,
    Expression<DateTime>? lastStudiedAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (unitId != null) 'unit_id': unitId,
      if (notesReadCount != null) 'notes_read_count': notesReadCount,
      if (questionsAttempted != null) 'questions_attempted': questionsAttempted,
      if (questionsCorrect != null) 'questions_correct': questionsCorrect,
      if (lastStudiedAt != null) 'last_studied_at': lastStudiedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgressTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? unitId,
    Value<int>? notesReadCount,
    Value<int>? questionsAttempted,
    Value<int>? questionsCorrect,
    Value<DateTime>? lastStudiedAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProgressTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      unitId: unitId ?? this.unitId,
      notesReadCount: notesReadCount ?? this.notesReadCount,
      questionsAttempted: questionsAttempted ?? this.questionsAttempted,
      questionsCorrect: questionsCorrect ?? this.questionsCorrect,
      lastStudiedAt: lastStudiedAt ?? this.lastStudiedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (notesReadCount.present) {
      map['notes_read_count'] = Variable<int>(notesReadCount.value);
    }
    if (questionsAttempted.present) {
      map['questions_attempted'] = Variable<int>(questionsAttempted.value);
    }
    if (questionsCorrect.present) {
      map['questions_correct'] = Variable<int>(questionsCorrect.value);
    }
    if (lastStudiedAt.present) {
      map['last_studied_at'] = Variable<DateTime>(lastStudiedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgressTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('unitId: $unitId, ')
          ..write('notesReadCount: $notesReadCount, ')
          ..write('questionsAttempted: $questionsAttempted, ')
          ..write('questionsCorrect: $questionsCorrect, ')
          ..write('lastStudiedAt: $lastStudiedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReadinessScoresTable extends ReadinessScores
    with TableInfo<$ReadinessScoresTable, ReadinessScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadinessScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesProgressPctMeta = const VerificationMeta(
    'notesProgressPct',
  );
  @override
  late final GeneratedColumn<double> notesProgressPct = GeneratedColumn<double>(
    'notes_progress_pct',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quizAccuracyPctMeta = const VerificationMeta(
    'quizAccuracyPct',
  );
  @override
  late final GeneratedColumn<double> quizAccuracyPct = GeneratedColumn<double>(
    'quiz_accuracy_pct',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pyqAccuracyPctMeta = const VerificationMeta(
    'pyqAccuracyPct',
  );
  @override
  late final GeneratedColumn<double> pyqAccuracyPct = GeneratedColumn<double>(
    'pyq_accuracy_pct',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _computedAtMeta = const VerificationMeta(
    'computedAt',
  );
  @override
  late final GeneratedColumn<DateTime> computedAt = GeneratedColumn<DateTime>(
    'computed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    score,
    notesProgressPct,
    quizAccuracyPct,
    pyqAccuracyPct,
    computedAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'readiness_scores';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReadinessScore> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('notes_progress_pct')) {
      context.handle(
        _notesProgressPctMeta,
        notesProgressPct.isAcceptableOrUnknown(
          data['notes_progress_pct']!,
          _notesProgressPctMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notesProgressPctMeta);
    }
    if (data.containsKey('quiz_accuracy_pct')) {
      context.handle(
        _quizAccuracyPctMeta,
        quizAccuracyPct.isAcceptableOrUnknown(
          data['quiz_accuracy_pct']!,
          _quizAccuracyPctMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quizAccuracyPctMeta);
    }
    if (data.containsKey('pyq_accuracy_pct')) {
      context.handle(
        _pyqAccuracyPctMeta,
        pyqAccuracyPct.isAcceptableOrUnknown(
          data['pyq_accuracy_pct']!,
          _pyqAccuracyPctMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pyqAccuracyPctMeta);
    }
    if (data.containsKey('computed_at')) {
      context.handle(
        _computedAtMeta,
        computedAt.isAcceptableOrUnknown(data['computed_at']!, _computedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_computedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReadinessScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadinessScore(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score'],
      )!,
      notesProgressPct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}notes_progress_pct'],
      )!,
      quizAccuracyPct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quiz_accuracy_pct'],
      )!,
      pyqAccuracyPct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pyq_accuracy_pct'],
      )!,
      computedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}computed_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ReadinessScoresTable createAlias(String alias) {
    return $ReadinessScoresTable(attachedDatabase, alias);
  }
}

class ReadinessScore extends DataClass implements Insertable<ReadinessScore> {
  final String id;
  final String userId;
  final double score;
  final double notesProgressPct;
  final double quizAccuracyPct;
  final double pyqAccuracyPct;
  final DateTime computedAt;
  final DateTime updatedAt;
  const ReadinessScore({
    required this.id,
    required this.userId,
    required this.score,
    required this.notesProgressPct,
    required this.quizAccuracyPct,
    required this.pyqAccuracyPct,
    required this.computedAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['score'] = Variable<double>(score);
    map['notes_progress_pct'] = Variable<double>(notesProgressPct);
    map['quiz_accuracy_pct'] = Variable<double>(quizAccuracyPct);
    map['pyq_accuracy_pct'] = Variable<double>(pyqAccuracyPct);
    map['computed_at'] = Variable<DateTime>(computedAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ReadinessScoresCompanion toCompanion(bool nullToAbsent) {
    return ReadinessScoresCompanion(
      id: Value(id),
      userId: Value(userId),
      score: Value(score),
      notesProgressPct: Value(notesProgressPct),
      quizAccuracyPct: Value(quizAccuracyPct),
      pyqAccuracyPct: Value(pyqAccuracyPct),
      computedAt: Value(computedAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ReadinessScore.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadinessScore(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      score: serializer.fromJson<double>(json['score']),
      notesProgressPct: serializer.fromJson<double>(json['notesProgressPct']),
      quizAccuracyPct: serializer.fromJson<double>(json['quizAccuracyPct']),
      pyqAccuracyPct: serializer.fromJson<double>(json['pyqAccuracyPct']),
      computedAt: serializer.fromJson<DateTime>(json['computedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'score': serializer.toJson<double>(score),
      'notesProgressPct': serializer.toJson<double>(notesProgressPct),
      'quizAccuracyPct': serializer.toJson<double>(quizAccuracyPct),
      'pyqAccuracyPct': serializer.toJson<double>(pyqAccuracyPct),
      'computedAt': serializer.toJson<DateTime>(computedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ReadinessScore copyWith({
    String? id,
    String? userId,
    double? score,
    double? notesProgressPct,
    double? quizAccuracyPct,
    double? pyqAccuracyPct,
    DateTime? computedAt,
    DateTime? updatedAt,
  }) => ReadinessScore(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    score: score ?? this.score,
    notesProgressPct: notesProgressPct ?? this.notesProgressPct,
    quizAccuracyPct: quizAccuracyPct ?? this.quizAccuracyPct,
    pyqAccuracyPct: pyqAccuracyPct ?? this.pyqAccuracyPct,
    computedAt: computedAt ?? this.computedAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ReadinessScore copyWithCompanion(ReadinessScoresCompanion data) {
    return ReadinessScore(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      score: data.score.present ? data.score.value : this.score,
      notesProgressPct: data.notesProgressPct.present
          ? data.notesProgressPct.value
          : this.notesProgressPct,
      quizAccuracyPct: data.quizAccuracyPct.present
          ? data.quizAccuracyPct.value
          : this.quizAccuracyPct,
      pyqAccuracyPct: data.pyqAccuracyPct.present
          ? data.pyqAccuracyPct.value
          : this.pyqAccuracyPct,
      computedAt: data.computedAt.present
          ? data.computedAt.value
          : this.computedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReadinessScore(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('score: $score, ')
          ..write('notesProgressPct: $notesProgressPct, ')
          ..write('quizAccuracyPct: $quizAccuracyPct, ')
          ..write('pyqAccuracyPct: $pyqAccuracyPct, ')
          ..write('computedAt: $computedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    score,
    notesProgressPct,
    quizAccuracyPct,
    pyqAccuracyPct,
    computedAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadinessScore &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.score == this.score &&
          other.notesProgressPct == this.notesProgressPct &&
          other.quizAccuracyPct == this.quizAccuracyPct &&
          other.pyqAccuracyPct == this.pyqAccuracyPct &&
          other.computedAt == this.computedAt &&
          other.updatedAt == this.updatedAt);
}

class ReadinessScoresCompanion extends UpdateCompanion<ReadinessScore> {
  final Value<String> id;
  final Value<String> userId;
  final Value<double> score;
  final Value<double> notesProgressPct;
  final Value<double> quizAccuracyPct;
  final Value<double> pyqAccuracyPct;
  final Value<DateTime> computedAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ReadinessScoresCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.score = const Value.absent(),
    this.notesProgressPct = const Value.absent(),
    this.quizAccuracyPct = const Value.absent(),
    this.pyqAccuracyPct = const Value.absent(),
    this.computedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReadinessScoresCompanion.insert({
    required String id,
    required String userId,
    required double score,
    required double notesProgressPct,
    required double quizAccuracyPct,
    required double pyqAccuracyPct,
    required DateTime computedAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       score = Value(score),
       notesProgressPct = Value(notesProgressPct),
       quizAccuracyPct = Value(quizAccuracyPct),
       pyqAccuracyPct = Value(pyqAccuracyPct),
       computedAt = Value(computedAt),
       updatedAt = Value(updatedAt);
  static Insertable<ReadinessScore> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<double>? score,
    Expression<double>? notesProgressPct,
    Expression<double>? quizAccuracyPct,
    Expression<double>? pyqAccuracyPct,
    Expression<DateTime>? computedAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (score != null) 'score': score,
      if (notesProgressPct != null) 'notes_progress_pct': notesProgressPct,
      if (quizAccuracyPct != null) 'quiz_accuracy_pct': quizAccuracyPct,
      if (pyqAccuracyPct != null) 'pyq_accuracy_pct': pyqAccuracyPct,
      if (computedAt != null) 'computed_at': computedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReadinessScoresCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<double>? score,
    Value<double>? notesProgressPct,
    Value<double>? quizAccuracyPct,
    Value<double>? pyqAccuracyPct,
    Value<DateTime>? computedAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ReadinessScoresCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      score: score ?? this.score,
      notesProgressPct: notesProgressPct ?? this.notesProgressPct,
      quizAccuracyPct: quizAccuracyPct ?? this.quizAccuracyPct,
      pyqAccuracyPct: pyqAccuracyPct ?? this.pyqAccuracyPct,
      computedAt: computedAt ?? this.computedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (notesProgressPct.present) {
      map['notes_progress_pct'] = Variable<double>(notesProgressPct.value);
    }
    if (quizAccuracyPct.present) {
      map['quiz_accuracy_pct'] = Variable<double>(quizAccuracyPct.value);
    }
    if (pyqAccuracyPct.present) {
      map['pyq_accuracy_pct'] = Variable<double>(pyqAccuracyPct.value);
    }
    if (computedAt.present) {
      map['computed_at'] = Variable<DateTime>(computedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadinessScoresCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('score: $score, ')
          ..write('notesProgressPct: $notesProgressPct, ')
          ..write('quizAccuracyPct: $quizAccuracyPct, ')
          ..write('pyqAccuracyPct: $pyqAccuracyPct, ')
          ..write('computedAt: $computedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $UnitsTable units = $UnitsTable(this);
  late final $TopicsTable topics = $TopicsTable(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $QuestionOptionsTable questionOptions = $QuestionOptionsTable(
    this,
  );
  late final $ExamAttemptsTable examAttempts = $ExamAttemptsTable(this);
  late final $AnswerLogsTable answerLogs = $AnswerLogsTable(this);
  late final $ProgressTableTable progressTable = $ProgressTableTable(this);
  late final $ReadinessScoresTable readinessScores = $ReadinessScoresTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    subjects,
    units,
    topics,
    notes,
    questions,
    questionOptions,
    examAttempts,
    answerLogs,
    progressTable,
    readinessScores,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String email,
      required String displayName,
      Value<bool> isGuest,
      required DateTime createdAt,
      required DateTime lastLoginAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> email,
      Value<String> displayName,
      Value<bool> isGuest,
      Value<DateTime> createdAt,
      Value<DateTime> lastLoginAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isGuest => $composableBuilder(
    column: $table.isGuest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastLoginAt => $composableBuilder(
    column: $table.lastLoginAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isGuest => $composableBuilder(
    column: $table.isGuest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastLoginAt => $composableBuilder(
    column: $table.lastLoginAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isGuest =>
      $composableBuilder(column: $table.isGuest, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLoginAt => $composableBuilder(
    column: $table.lastLoginAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<bool> isGuest = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> lastLoginAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                email: email,
                displayName: displayName,
                isGuest: isGuest,
                createdAt: createdAt,
                lastLoginAt: lastLoginAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String email,
                required String displayName,
                Value<bool> isGuest = const Value.absent(),
                required DateTime createdAt,
                required DateTime lastLoginAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                email: email,
                displayName: displayName,
                isGuest: isGuest,
                createdAt: createdAt,
                lastLoginAt: lastLoginAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UsersTable, User>(table),
                  BaseReferences<_$AppDatabase, $UsersTable, User>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;
typedef $$SubjectsTableCreateCompanionBuilder =
    SubjectsCompanion Function({
      required String id,
      required String code,
      required String name,
      required String description,
      Value<int> orderIndex,
      Value<int> rowid,
    });
typedef $$SubjectsTableUpdateCompanionBuilder =
    SubjectsCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String> description,
      Value<int> orderIndex,
      Value<int> rowid,
    });

class $$SubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );
}

class $$SubjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubjectsTable,
          Subject,
          $$SubjectsTableFilterComposer,
          $$SubjectsTableOrderingComposer,
          $$SubjectsTableAnnotationComposer,
          $$SubjectsTableCreateCompanionBuilder,
          $$SubjectsTableUpdateCompanionBuilder,
          (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
          Subject,
          PrefetchHooks Function()
        > {
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                required String description,
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SubjectsTable, Subject>(table),
                  BaseReferences<_$AppDatabase, $SubjectsTable, Subject>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubjectsTable,
      Subject,
      $$SubjectsTableFilterComposer,
      $$SubjectsTableOrderingComposer,
      $$SubjectsTableAnnotationComposer,
      $$SubjectsTableCreateCompanionBuilder,
      $$SubjectsTableUpdateCompanionBuilder,
      (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
      Subject,
      PrefetchHooks Function()
    >;
typedef $$UnitsTableCreateCompanionBuilder =
    UnitsCompanion Function({
      required String id,
      required String subjectId,
      required int unitNumber,
      required String code,
      required String title,
      required String description,
      Value<int> weightageQuestions,
      Value<int> rowid,
    });
typedef $$UnitsTableUpdateCompanionBuilder =
    UnitsCompanion Function({
      Value<String> id,
      Value<String> subjectId,
      Value<int> unitNumber,
      Value<String> code,
      Value<String> title,
      Value<String> description,
      Value<int> weightageQuestions,
      Value<int> rowid,
    });

class $$UnitsTableFilterComposer extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitNumber => $composableBuilder(
    column: $table.unitNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weightageQuestions => $composableBuilder(
    column: $table.weightageQuestions,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitNumber => $composableBuilder(
    column: $table.unitNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weightageQuestions => $composableBuilder(
    column: $table.weightageQuestions,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<int> get unitNumber => $composableBuilder(
    column: $table.unitNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weightageQuestions => $composableBuilder(
    column: $table.weightageQuestions,
    builder: (column) => column,
  );
}

class $$UnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitsTable,
          Unit,
          $$UnitsTableFilterComposer,
          $$UnitsTableOrderingComposer,
          $$UnitsTableAnnotationComposer,
          $$UnitsTableCreateCompanionBuilder,
          $$UnitsTableUpdateCompanionBuilder,
          (Unit, BaseReferences<_$AppDatabase, $UnitsTable, Unit>),
          Unit,
          PrefetchHooks Function()
        > {
  $$UnitsTableTableManager(_$AppDatabase db, $UnitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> subjectId = const Value.absent(),
                Value<int> unitNumber = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> weightageQuestions = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitsCompanion(
                id: id,
                subjectId: subjectId,
                unitNumber: unitNumber,
                code: code,
                title: title,
                description: description,
                weightageQuestions: weightageQuestions,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String subjectId,
                required int unitNumber,
                required String code,
                required String title,
                required String description,
                Value<int> weightageQuestions = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitsCompanion.insert(
                id: id,
                subjectId: subjectId,
                unitNumber: unitNumber,
                code: code,
                title: title,
                description: description,
                weightageQuestions: weightageQuestions,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UnitsTable, Unit>(table),
                  BaseReferences<_$AppDatabase, $UnitsTable, Unit>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitsTable,
      Unit,
      $$UnitsTableFilterComposer,
      $$UnitsTableOrderingComposer,
      $$UnitsTableAnnotationComposer,
      $$UnitsTableCreateCompanionBuilder,
      $$UnitsTableUpdateCompanionBuilder,
      (Unit, BaseReferences<_$AppDatabase, $UnitsTable, Unit>),
      Unit,
      PrefetchHooks Function()
    >;
typedef $$TopicsTableCreateCompanionBuilder =
    TopicsCompanion Function({
      required String id,
      required String unitId,
      required String topicNumber,
      required String code,
      required String title,
      Value<int> rowid,
    });
typedef $$TopicsTableUpdateCompanionBuilder =
    TopicsCompanion Function({
      Value<String> id,
      Value<String> unitId,
      Value<String> topicNumber,
      Value<String> code,
      Value<String> title,
      Value<int> rowid,
    });

class $$TopicsTableFilterComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topicNumber => $composableBuilder(
    column: $table.topicNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TopicsTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topicNumber => $composableBuilder(
    column: $table.topicNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TopicsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get topicNumber => $composableBuilder(
    column: $table.topicNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);
}

class $$TopicsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TopicsTable,
          Topic,
          $$TopicsTableFilterComposer,
          $$TopicsTableOrderingComposer,
          $$TopicsTableAnnotationComposer,
          $$TopicsTableCreateCompanionBuilder,
          $$TopicsTableUpdateCompanionBuilder,
          (Topic, BaseReferences<_$AppDatabase, $TopicsTable, Topic>),
          Topic,
          PrefetchHooks Function()
        > {
  $$TopicsTableTableManager(_$AppDatabase db, $TopicsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<String> topicNumber = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TopicsCompanion(
                id: id,
                unitId: unitId,
                topicNumber: topicNumber,
                code: code,
                title: title,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String unitId,
                required String topicNumber,
                required String code,
                required String title,
                Value<int> rowid = const Value.absent(),
              }) => TopicsCompanion.insert(
                id: id,
                unitId: unitId,
                topicNumber: topicNumber,
                code: code,
                title: title,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TopicsTable, Topic>(table),
                  BaseReferences<_$AppDatabase, $TopicsTable, Topic>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TopicsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TopicsTable,
      Topic,
      $$TopicsTableFilterComposer,
      $$TopicsTableOrderingComposer,
      $$TopicsTableAnnotationComposer,
      $$TopicsTableCreateCompanionBuilder,
      $$TopicsTableUpdateCompanionBuilder,
      (Topic, BaseReferences<_$AppDatabase, $TopicsTable, Topic>),
      Topic,
      PrefetchHooks Function()
    >;
typedef $$NotesTableCreateCompanionBuilder =
    NotesCompanion Function({
      required String id,
      required String unitId,
      required String topicId,
      required String title,
      required String filePath,
      Value<int> estimatedReadMinutes,
      Value<bool> isCompleted,
      Value<bool> isBookmarked,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$NotesTableUpdateCompanionBuilder =
    NotesCompanion Function({
      Value<String> id,
      Value<String> unitId,
      Value<String> topicId,
      Value<String> title,
      Value<String> filePath,
      Value<int> estimatedReadMinutes,
      Value<bool> isCompleted,
      Value<bool> isBookmarked,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topicId => $composableBuilder(
    column: $table.topicId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedReadMinutes => $composableBuilder(
    column: $table.estimatedReadMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topicId => $composableBuilder(
    column: $table.topicId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedReadMinutes => $composableBuilder(
    column: $table.estimatedReadMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get topicId =>
      $composableBuilder(column: $table.topicId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<int> get estimatedReadMinutes => $composableBuilder(
    column: $table.estimatedReadMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$NotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotesTable,
          Note,
          $$NotesTableFilterComposer,
          $$NotesTableOrderingComposer,
          $$NotesTableAnnotationComposer,
          $$NotesTableCreateCompanionBuilder,
          $$NotesTableUpdateCompanionBuilder,
          (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
          Note,
          PrefetchHooks Function()
        > {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<String> topicId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<int> estimatedReadMinutes = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion(
                id: id,
                unitId: unitId,
                topicId: topicId,
                title: title,
                filePath: filePath,
                estimatedReadMinutes: estimatedReadMinutes,
                isCompleted: isCompleted,
                isBookmarked: isBookmarked,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String unitId,
                required String topicId,
                required String title,
                required String filePath,
                Value<int> estimatedReadMinutes = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion.insert(
                id: id,
                unitId: unitId,
                topicId: topicId,
                title: title,
                filePath: filePath,
                estimatedReadMinutes: estimatedReadMinutes,
                isCompleted: isCompleted,
                isBookmarked: isBookmarked,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$NotesTable, Note>(table),
                  BaseReferences<_$AppDatabase, $NotesTable, Note>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotesTable,
      Note,
      $$NotesTableFilterComposer,
      $$NotesTableOrderingComposer,
      $$NotesTableAnnotationComposer,
      $$NotesTableCreateCompanionBuilder,
      $$NotesTableUpdateCompanionBuilder,
      (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
      Note,
      PrefetchHooks Function()
    >;
typedef $$QuestionsTableCreateCompanionBuilder =
    QuestionsCompanion Function({
      required String id,
      required String unitId,
      required String topicId,
      required String questionText,
      required String explanation,
      Value<int?> year,
      Value<bool> isPyq,
      required String sourceType,
      Value<String> difficulty,
      Value<int> rowid,
    });
typedef $$QuestionsTableUpdateCompanionBuilder =
    QuestionsCompanion Function({
      Value<String> id,
      Value<String> unitId,
      Value<String> topicId,
      Value<String> questionText,
      Value<String> explanation,
      Value<int?> year,
      Value<bool> isPyq,
      Value<String> sourceType,
      Value<String> difficulty,
      Value<int> rowid,
    });

class $$QuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topicId => $composableBuilder(
    column: $table.topicId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPyq => $composableBuilder(
    column: $table.isPyq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topicId => $composableBuilder(
    column: $table.topicId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPyq => $composableBuilder(
    column: $table.isPyq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get topicId =>
      $composableBuilder(column: $table.topicId, builder: (column) => column);

  GeneratedColumn<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<bool> get isPyq =>
      $composableBuilder(column: $table.isPyq, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );
}

class $$QuestionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionsTable,
          Question,
          $$QuestionsTableFilterComposer,
          $$QuestionsTableOrderingComposer,
          $$QuestionsTableAnnotationComposer,
          $$QuestionsTableCreateCompanionBuilder,
          $$QuestionsTableUpdateCompanionBuilder,
          (Question, BaseReferences<_$AppDatabase, $QuestionsTable, Question>),
          Question,
          PrefetchHooks Function()
        > {
  $$QuestionsTableTableManager(_$AppDatabase db, $QuestionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<String> topicId = const Value.absent(),
                Value<String> questionText = const Value.absent(),
                Value<String> explanation = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<bool> isPyq = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionsCompanion(
                id: id,
                unitId: unitId,
                topicId: topicId,
                questionText: questionText,
                explanation: explanation,
                year: year,
                isPyq: isPyq,
                sourceType: sourceType,
                difficulty: difficulty,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String unitId,
                required String topicId,
                required String questionText,
                required String explanation,
                Value<int?> year = const Value.absent(),
                Value<bool> isPyq = const Value.absent(),
                required String sourceType,
                Value<String> difficulty = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionsCompanion.insert(
                id: id,
                unitId: unitId,
                topicId: topicId,
                questionText: questionText,
                explanation: explanation,
                year: year,
                isPyq: isPyq,
                sourceType: sourceType,
                difficulty: difficulty,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuestionsTable, Question>(table),
                  BaseReferences<_$AppDatabase, $QuestionsTable, Question>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionsTable,
      Question,
      $$QuestionsTableFilterComposer,
      $$QuestionsTableOrderingComposer,
      $$QuestionsTableAnnotationComposer,
      $$QuestionsTableCreateCompanionBuilder,
      $$QuestionsTableUpdateCompanionBuilder,
      (Question, BaseReferences<_$AppDatabase, $QuestionsTable, Question>),
      Question,
      PrefetchHooks Function()
    >;
typedef $$QuestionOptionsTableCreateCompanionBuilder =
    QuestionOptionsCompanion Function({
      required String id,
      required String questionId,
      required String optionLetter,
      required String textContent,
      required bool isCorrect,
      Value<int> rowid,
    });
typedef $$QuestionOptionsTableUpdateCompanionBuilder =
    QuestionOptionsCompanion Function({
      Value<String> id,
      Value<String> questionId,
      Value<String> optionLetter,
      Value<String> textContent,
      Value<bool> isCorrect,
      Value<int> rowid,
    });

class $$QuestionOptionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionOptionsTable> {
  $$QuestionOptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get optionLetter => $composableBuilder(
    column: $table.optionLetter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuestionOptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionOptionsTable> {
  $$QuestionOptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get optionLetter => $composableBuilder(
    column: $table.optionLetter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuestionOptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionOptionsTable> {
  $$QuestionOptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get optionLetter => $composableBuilder(
    column: $table.optionLetter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);
}

class $$QuestionOptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionOptionsTable,
          QuestionOption,
          $$QuestionOptionsTableFilterComposer,
          $$QuestionOptionsTableOrderingComposer,
          $$QuestionOptionsTableAnnotationComposer,
          $$QuestionOptionsTableCreateCompanionBuilder,
          $$QuestionOptionsTableUpdateCompanionBuilder,
          (
            QuestionOption,
            BaseReferences<
              _$AppDatabase,
              $QuestionOptionsTable,
              QuestionOption
            >,
          ),
          QuestionOption,
          PrefetchHooks Function()
        > {
  $$QuestionOptionsTableTableManager(
    _$AppDatabase db,
    $QuestionOptionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionOptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionOptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionOptionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> questionId = const Value.absent(),
                Value<String> optionLetter = const Value.absent(),
                Value<String> textContent = const Value.absent(),
                Value<bool> isCorrect = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionOptionsCompanion(
                id: id,
                questionId: questionId,
                optionLetter: optionLetter,
                textContent: textContent,
                isCorrect: isCorrect,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String questionId,
                required String optionLetter,
                required String textContent,
                required bool isCorrect,
                Value<int> rowid = const Value.absent(),
              }) => QuestionOptionsCompanion.insert(
                id: id,
                questionId: questionId,
                optionLetter: optionLetter,
                textContent: textContent,
                isCorrect: isCorrect,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuestionOptionsTable, QuestionOption>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $QuestionOptionsTable,
                    QuestionOption
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuestionOptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionOptionsTable,
      QuestionOption,
      $$QuestionOptionsTableFilterComposer,
      $$QuestionOptionsTableOrderingComposer,
      $$QuestionOptionsTableAnnotationComposer,
      $$QuestionOptionsTableCreateCompanionBuilder,
      $$QuestionOptionsTableUpdateCompanionBuilder,
      (
        QuestionOption,
        BaseReferences<_$AppDatabase, $QuestionOptionsTable, QuestionOption>,
      ),
      QuestionOption,
      PrefetchHooks Function()
    >;
typedef $$ExamAttemptsTableCreateCompanionBuilder =
    ExamAttemptsCompanion Function({
      required String id,
      required String userId,
      required String title,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      required int durationSeconds,
      required int score,
      required int totalQuestions,
      required bool passed,
      required String answersJson,
      Value<bool> isPyq,
      Value<int?> year,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ExamAttemptsTableUpdateCompanionBuilder =
    ExamAttemptsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> title,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<int> durationSeconds,
      Value<int> score,
      Value<int> totalQuestions,
      Value<bool> passed,
      Value<String> answersJson,
      Value<bool> isPyq,
      Value<int?> year,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ExamAttemptsTableFilterComposer
    extends Composer<_$AppDatabase, $ExamAttemptsTable> {
  $$ExamAttemptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get passed => $composableBuilder(
    column: $table.passed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answersJson => $composableBuilder(
    column: $table.answersJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPyq => $composableBuilder(
    column: $table.isPyq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExamAttemptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExamAttemptsTable> {
  $$ExamAttemptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get passed => $composableBuilder(
    column: $table.passed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answersJson => $composableBuilder(
    column: $table.answersJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPyq => $composableBuilder(
    column: $table.isPyq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExamAttemptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExamAttemptsTable> {
  $$ExamAttemptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get passed =>
      $composableBuilder(column: $table.passed, builder: (column) => column);

  GeneratedColumn<String> get answersJson => $composableBuilder(
    column: $table.answersJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPyq =>
      $composableBuilder(column: $table.isPyq, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ExamAttemptsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExamAttemptsTable,
          ExamAttempt,
          $$ExamAttemptsTableFilterComposer,
          $$ExamAttemptsTableOrderingComposer,
          $$ExamAttemptsTableAnnotationComposer,
          $$ExamAttemptsTableCreateCompanionBuilder,
          $$ExamAttemptsTableUpdateCompanionBuilder,
          (
            ExamAttempt,
            BaseReferences<_$AppDatabase, $ExamAttemptsTable, ExamAttempt>,
          ),
          ExamAttempt,
          PrefetchHooks Function()
        > {
  $$ExamAttemptsTableTableManager(_$AppDatabase db, $ExamAttemptsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExamAttemptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExamAttemptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExamAttemptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<int> totalQuestions = const Value.absent(),
                Value<bool> passed = const Value.absent(),
                Value<String> answersJson = const Value.absent(),
                Value<bool> isPyq = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExamAttemptsCompanion(
                id: id,
                userId: userId,
                title: title,
                startedAt: startedAt,
                completedAt: completedAt,
                durationSeconds: durationSeconds,
                score: score,
                totalQuestions: totalQuestions,
                passed: passed,
                answersJson: answersJson,
                isPyq: isPyq,
                year: year,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String title,
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                required int durationSeconds,
                required int score,
                required int totalQuestions,
                required bool passed,
                required String answersJson,
                Value<bool> isPyq = const Value.absent(),
                Value<int?> year = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ExamAttemptsCompanion.insert(
                id: id,
                userId: userId,
                title: title,
                startedAt: startedAt,
                completedAt: completedAt,
                durationSeconds: durationSeconds,
                score: score,
                totalQuestions: totalQuestions,
                passed: passed,
                answersJson: answersJson,
                isPyq: isPyq,
                year: year,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExamAttemptsTable, ExamAttempt>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ExamAttemptsTable,
                    ExamAttempt
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExamAttemptsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExamAttemptsTable,
      ExamAttempt,
      $$ExamAttemptsTableFilterComposer,
      $$ExamAttemptsTableOrderingComposer,
      $$ExamAttemptsTableAnnotationComposer,
      $$ExamAttemptsTableCreateCompanionBuilder,
      $$ExamAttemptsTableUpdateCompanionBuilder,
      (
        ExamAttempt,
        BaseReferences<_$AppDatabase, $ExamAttemptsTable, ExamAttempt>,
      ),
      ExamAttempt,
      PrefetchHooks Function()
    >;
typedef $$AnswerLogsTableCreateCompanionBuilder =
    AnswerLogsCompanion Function({
      required String id,
      required String userId,
      required String questionId,
      Value<String?> selectedOptionId,
      required bool isCorrect,
      required DateTime timestamp,
      required String mode,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AnswerLogsTableUpdateCompanionBuilder =
    AnswerLogsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> questionId,
      Value<String?> selectedOptionId,
      Value<bool> isCorrect,
      Value<DateTime> timestamp,
      Value<String> mode,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AnswerLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AnswerLogsTable> {
  $$AnswerLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedOptionId => $composableBuilder(
    column: $table.selectedOptionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AnswerLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AnswerLogsTable> {
  $$AnswerLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedOptionId => $composableBuilder(
    column: $table.selectedOptionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnswerLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnswerLogsTable> {
  $$AnswerLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedOptionId => $composableBuilder(
    column: $table.selectedOptionId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AnswerLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnswerLogsTable,
          AnswerLog,
          $$AnswerLogsTableFilterComposer,
          $$AnswerLogsTableOrderingComposer,
          $$AnswerLogsTableAnnotationComposer,
          $$AnswerLogsTableCreateCompanionBuilder,
          $$AnswerLogsTableUpdateCompanionBuilder,
          (
            AnswerLog,
            BaseReferences<_$AppDatabase, $AnswerLogsTable, AnswerLog>,
          ),
          AnswerLog,
          PrefetchHooks Function()
        > {
  $$AnswerLogsTableTableManager(_$AppDatabase db, $AnswerLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnswerLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnswerLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnswerLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> questionId = const Value.absent(),
                Value<String?> selectedOptionId = const Value.absent(),
                Value<bool> isCorrect = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnswerLogsCompanion(
                id: id,
                userId: userId,
                questionId: questionId,
                selectedOptionId: selectedOptionId,
                isCorrect: isCorrect,
                timestamp: timestamp,
                mode: mode,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String questionId,
                Value<String?> selectedOptionId = const Value.absent(),
                required bool isCorrect,
                required DateTime timestamp,
                required String mode,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AnswerLogsCompanion.insert(
                id: id,
                userId: userId,
                questionId: questionId,
                selectedOptionId: selectedOptionId,
                isCorrect: isCorrect,
                timestamp: timestamp,
                mode: mode,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AnswerLogsTable, AnswerLog>(table),
                  BaseReferences<_$AppDatabase, $AnswerLogsTable, AnswerLog>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AnswerLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnswerLogsTable,
      AnswerLog,
      $$AnswerLogsTableFilterComposer,
      $$AnswerLogsTableOrderingComposer,
      $$AnswerLogsTableAnnotationComposer,
      $$AnswerLogsTableCreateCompanionBuilder,
      $$AnswerLogsTableUpdateCompanionBuilder,
      (AnswerLog, BaseReferences<_$AppDatabase, $AnswerLogsTable, AnswerLog>),
      AnswerLog,
      PrefetchHooks Function()
    >;
typedef $$ProgressTableTableCreateCompanionBuilder =
    ProgressTableCompanion Function({
      required String id,
      required String userId,
      required String unitId,
      Value<int> notesReadCount,
      Value<int> questionsAttempted,
      Value<int> questionsCorrect,
      required DateTime lastStudiedAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ProgressTableTableUpdateCompanionBuilder =
    ProgressTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> unitId,
      Value<int> notesReadCount,
      Value<int> questionsAttempted,
      Value<int> questionsCorrect,
      Value<DateTime> lastStudiedAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ProgressTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProgressTableTable> {
  $$ProgressTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notesReadCount => $composableBuilder(
    column: $table.notesReadCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get questionsAttempted => $composableBuilder(
    column: $table.questionsAttempted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get questionsCorrect => $composableBuilder(
    column: $table.questionsCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastStudiedAt => $composableBuilder(
    column: $table.lastStudiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProgressTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgressTableTable> {
  $$ProgressTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notesReadCount => $composableBuilder(
    column: $table.notesReadCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get questionsAttempted => $composableBuilder(
    column: $table.questionsAttempted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get questionsCorrect => $composableBuilder(
    column: $table.questionsCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastStudiedAt => $composableBuilder(
    column: $table.lastStudiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProgressTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgressTableTable> {
  $$ProgressTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<int> get notesReadCount => $composableBuilder(
    column: $table.notesReadCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get questionsAttempted => $composableBuilder(
    column: $table.questionsAttempted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get questionsCorrect => $composableBuilder(
    column: $table.questionsCorrect,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastStudiedAt => $composableBuilder(
    column: $table.lastStudiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProgressTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgressTableTable,
          ProgressTableData,
          $$ProgressTableTableFilterComposer,
          $$ProgressTableTableOrderingComposer,
          $$ProgressTableTableAnnotationComposer,
          $$ProgressTableTableCreateCompanionBuilder,
          $$ProgressTableTableUpdateCompanionBuilder,
          (
            ProgressTableData,
            BaseReferences<
              _$AppDatabase,
              $ProgressTableTable,
              ProgressTableData
            >,
          ),
          ProgressTableData,
          PrefetchHooks Function()
        > {
  $$ProgressTableTableTableManager(_$AppDatabase db, $ProgressTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgressTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgressTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgressTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<int> notesReadCount = const Value.absent(),
                Value<int> questionsAttempted = const Value.absent(),
                Value<int> questionsCorrect = const Value.absent(),
                Value<DateTime> lastStudiedAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressTableCompanion(
                id: id,
                userId: userId,
                unitId: unitId,
                notesReadCount: notesReadCount,
                questionsAttempted: questionsAttempted,
                questionsCorrect: questionsCorrect,
                lastStudiedAt: lastStudiedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String unitId,
                Value<int> notesReadCount = const Value.absent(),
                Value<int> questionsAttempted = const Value.absent(),
                Value<int> questionsCorrect = const Value.absent(),
                required DateTime lastStudiedAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ProgressTableCompanion.insert(
                id: id,
                userId: userId,
                unitId: unitId,
                notesReadCount: notesReadCount,
                questionsAttempted: questionsAttempted,
                questionsCorrect: questionsCorrect,
                lastStudiedAt: lastStudiedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProgressTableTable, ProgressTableData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ProgressTableTable,
                    ProgressTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProgressTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgressTableTable,
      ProgressTableData,
      $$ProgressTableTableFilterComposer,
      $$ProgressTableTableOrderingComposer,
      $$ProgressTableTableAnnotationComposer,
      $$ProgressTableTableCreateCompanionBuilder,
      $$ProgressTableTableUpdateCompanionBuilder,
      (
        ProgressTableData,
        BaseReferences<_$AppDatabase, $ProgressTableTable, ProgressTableData>,
      ),
      ProgressTableData,
      PrefetchHooks Function()
    >;
typedef $$ReadinessScoresTableCreateCompanionBuilder =
    ReadinessScoresCompanion Function({
      required String id,
      required String userId,
      required double score,
      required double notesProgressPct,
      required double quizAccuracyPct,
      required double pyqAccuracyPct,
      required DateTime computedAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ReadinessScoresTableUpdateCompanionBuilder =
    ReadinessScoresCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<double> score,
      Value<double> notesProgressPct,
      Value<double> quizAccuracyPct,
      Value<double> pyqAccuracyPct,
      Value<DateTime> computedAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ReadinessScoresTableFilterComposer
    extends Composer<_$AppDatabase, $ReadinessScoresTable> {
  $$ReadinessScoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get notesProgressPct => $composableBuilder(
    column: $table.notesProgressPct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quizAccuracyPct => $composableBuilder(
    column: $table.quizAccuracyPct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pyqAccuracyPct => $composableBuilder(
    column: $table.pyqAccuracyPct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get computedAt => $composableBuilder(
    column: $table.computedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReadinessScoresTableOrderingComposer
    extends Composer<_$AppDatabase, $ReadinessScoresTable> {
  $$ReadinessScoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get notesProgressPct => $composableBuilder(
    column: $table.notesProgressPct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quizAccuracyPct => $composableBuilder(
    column: $table.quizAccuracyPct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pyqAccuracyPct => $composableBuilder(
    column: $table.pyqAccuracyPct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get computedAt => $composableBuilder(
    column: $table.computedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReadinessScoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReadinessScoresTable> {
  $$ReadinessScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<double> get notesProgressPct => $composableBuilder(
    column: $table.notesProgressPct,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quizAccuracyPct => $composableBuilder(
    column: $table.quizAccuracyPct,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pyqAccuracyPct => $composableBuilder(
    column: $table.pyqAccuracyPct,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get computedAt => $composableBuilder(
    column: $table.computedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ReadinessScoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReadinessScoresTable,
          ReadinessScore,
          $$ReadinessScoresTableFilterComposer,
          $$ReadinessScoresTableOrderingComposer,
          $$ReadinessScoresTableAnnotationComposer,
          $$ReadinessScoresTableCreateCompanionBuilder,
          $$ReadinessScoresTableUpdateCompanionBuilder,
          (
            ReadinessScore,
            BaseReferences<
              _$AppDatabase,
              $ReadinessScoresTable,
              ReadinessScore
            >,
          ),
          ReadinessScore,
          PrefetchHooks Function()
        > {
  $$ReadinessScoresTableTableManager(
    _$AppDatabase db,
    $ReadinessScoresTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadinessScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadinessScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReadinessScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<double> score = const Value.absent(),
                Value<double> notesProgressPct = const Value.absent(),
                Value<double> quizAccuracyPct = const Value.absent(),
                Value<double> pyqAccuracyPct = const Value.absent(),
                Value<DateTime> computedAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReadinessScoresCompanion(
                id: id,
                userId: userId,
                score: score,
                notesProgressPct: notesProgressPct,
                quizAccuracyPct: quizAccuracyPct,
                pyqAccuracyPct: pyqAccuracyPct,
                computedAt: computedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required double score,
                required double notesProgressPct,
                required double quizAccuracyPct,
                required double pyqAccuracyPct,
                required DateTime computedAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ReadinessScoresCompanion.insert(
                id: id,
                userId: userId,
                score: score,
                notesProgressPct: notesProgressPct,
                quizAccuracyPct: quizAccuracyPct,
                pyqAccuracyPct: pyqAccuracyPct,
                computedAt: computedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReadinessScoresTable, ReadinessScore>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ReadinessScoresTable,
                    ReadinessScore
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReadinessScoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReadinessScoresTable,
      ReadinessScore,
      $$ReadinessScoresTableFilterComposer,
      $$ReadinessScoresTableOrderingComposer,
      $$ReadinessScoresTableAnnotationComposer,
      $$ReadinessScoresTableCreateCompanionBuilder,
      $$ReadinessScoresTableUpdateCompanionBuilder,
      (
        ReadinessScore,
        BaseReferences<_$AppDatabase, $ReadinessScoresTable, ReadinessScore>,
      ),
      ReadinessScore,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db, _db.topics);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$QuestionOptionsTableTableManager get questionOptions =>
      $$QuestionOptionsTableTableManager(_db, _db.questionOptions);
  $$ExamAttemptsTableTableManager get examAttempts =>
      $$ExamAttemptsTableTableManager(_db, _db.examAttempts);
  $$AnswerLogsTableTableManager get answerLogs =>
      $$AnswerLogsTableTableManager(_db, _db.answerLogs);
  $$ProgressTableTableTableManager get progressTable =>
      $$ProgressTableTableTableManager(_db, _db.progressTable);
  $$ReadinessScoresTableTableManager get readinessScores =>
      $$ReadinessScoresTableTableManager(_db, _db.readinessScores);
}
