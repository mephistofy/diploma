
import 'package:diploma_v1/fake_data/users.dart';

import 'departments.dart';

var date = DateTime.utc(1989, 11, 9);

var statuses = [
  'available',
  'inProgress',
  'completed'
];

var TASKS_FAKE= [
  {
    "id": 1,
    "content": "It is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "comment": "You can't always get what you want...",
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[0]["id"],
      "name": fakeUsers[0]["fullname"],
    },
  },

  {
    "id": 2,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "rubahooba@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[0]["id"],
      "name": fakeUsers[0]["fullname"],
    },
  },

  {
    "id": 3,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[1]["fullname"],
    },
  },

  {
    "id": 4,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 5,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 6,
    "content":      "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the" +
        "border outline.The input decorator'Despite Portugal's territorial claims in Angola, its control over much of the country's vast interior was" +
        "minimal.[14] In the 16th century Portugal gained control of the coast through a series of treaties and wars. Life for European colonists was" +
        "difficult and progress slow. John Iliffe notes that Portuguese records of Angola from the 16th century show that a great famine occurred on" +
        "average every seventy years; accompanied by epidemic disease, it might kill one-third or one-half of the population, destroying the demographic" +
        "growth of a generation and forcing colonists back into the river valleys" +
        "During the Portuguese Restoration War, the Dutch West India Company occupied the principal settlement of Luanda in 1641, using alliances with local" +
        "peoples to carry out attacks against Portuguese holdings elsewhere.[18] A fleet under Salvador de Sá retook Luanda in 1648; reconquest of the rest" +
        "of the territory was status by 1650. New treaties with the Kongo were signed in 1649; others with Njinga's Kingdom of Matamba and Ndongo" +
        "followed in 1656. The conquest of Pungo Andongo in 1671 was the last major Portuguese expansion from Luanda, as attempts to invade Kongo" +
        "in 1670 and Matamba in 1681 failed. Colonial outposts also expanded inward from Benguela, but until the late 19th century the inroads" +
        "from Luanda and Benguela were very limited.[14] Hamstrung by a series of political upheavals in the early 1800s, Portugal was slow" +
        "to mount a large scale annexation of Angolan territory.[18] s 'container' is the optionally filled area above" +
        "the decorator's helper, error, and counter."
    ,
    "sender": "rubahooba@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 7,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[4]['id'],
      "name": DEPARTMENTS_FAKE[4]['name'],
    },
    "executor": {
      "id": fakeUsers[6]["id"],
      "name": fakeUsers[6]["fullname"],
    },
  },

  {
    "id": 8,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 9,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 10,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "rubahooba@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[1]['id'],
      "name": DEPARTMENTS_FAKE[1]['name'],
    },
    "executor": {
      "id": fakeUsers[1]["id"],
      "name": fakeUsers[1]["fullname"],
    },
  },

  {
    "id": 11,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[1]['id'],
      "name": DEPARTMENTS_FAKE[1]['name'],
    },
    "executor": {
      "id": fakeUsers[1]["id"],
      "name": fakeUsers[1]["fullname"],
    },
  },

  {
    "id": 12,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[1],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 13,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[2],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 14,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "rubahooba@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[2],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 16,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[2],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 17,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[2],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
    "executor": {
      "id": fakeUsers[2]["id"],
      "name": fakeUsers[2]["fullname"],
    },
  },

  {
    "id": 18,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[2],
    "department": {
      "id": DEPARTMENTS_FAKE[3]['id'],
      "name": DEPARTMENTS_FAKE[3]['name'],
    },
    "executor": {
      "id": fakeUsers[4]["id"],
      "name": fakeUsers[4]["fullname"],
    },
  },

  {
    "id": 19,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "rubahooba@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[2],
    "department": {
      "id": DEPARTMENTS_FAKE[3]['id'],
      "name": DEPARTMENTS_FAKE[3]['name'],
    },
    "executor": {
      "id": fakeUsers[3]["id"],
      "name": fakeUsers[3]["fullname"],
    },
  },

  {
    "id": 20,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[0],
    "department": {
      "id": DEPARTMENTS_FAKE[5]['id'],
      "name": DEPARTMENTS_FAKE[5]['name'],
    },
  },

  {
    "id": 21,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[0],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
  },

  {
    "id": 51,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[0],
    "comment": "You can't always get what you want...",
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
  },

  {
    "id": 22,
    "content":      "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the" +
  "border outline.The input decorator'Despite Portugal's territorial claims in Angola, its control over much of the country's vast interior was" +
  "minimal.[14] In the 16th century Portugal gained control of the coast through a series of treaties and wars. Life for European colonists was" +
  "difficult and progress slow. John Iliffe notes that Portuguese records of Angola from the 16th century show that a great famine occurred on" +
  "average every seventy years; accompanied by epidemic disease, it might kill one-third or one-half of the population, destroying the demographic" +
  "growth of a generation and forcing colonists back into the river valleys" +
  "During the Portuguese Restoration War, the Dutch West India Company occupied the principal settlement of Luanda in 1641, using alliances with local" +
  "peoples to carry out attacks against Portuguese holdings elsewhere.[18] A fleet under Salvador de Sá retook Luanda in 1648; reconquest of the rest" +
  "of the territory was completed by 1650. New treaties with the Kongo were signed in 1649; others with Njinga's Kingdom of Matamba and Ndongo" +
  "followed in 1656. The conquest of Pungo Andongo in 1671 was the last major Portuguese expansion from Luanda, as attempts to invade Kongo" +
  "in 1670 and Matamba in 1681 failed. Colonial outposts also expanded inward from Benguela, but until the late 19th century the inroads" +
  "from Luanda and Benguela were very limited.[14] Hamstrung by a series of political upheavals in the early 1800s, Portugal was slow" +
  "to mount a large scale annexation of Angolan territory.[18] s 'container' is the optionally filled area above" +
  "the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[0],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
  },

  {
    "id": 23,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[0],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
  },

  {
    "id": 24,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[0],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
  },

  {
    "id": 25,
    "content": "When the input decorator's label is floating, for example because its input child has the focus, the label appears in a gap in the border outline.The input decorator's 'container' is the optionally filled area above the decorator's helper, error, and counter.",
    "sender": "alexcychek@rumba.com",
    "created_at": date,
    "updated_at": date,
    "status": statuses[0],
    "department": {
      "id": DEPARTMENTS_FAKE[0]['id'],
      "name": DEPARTMENTS_FAKE[0]['name'],
    },
  }
];