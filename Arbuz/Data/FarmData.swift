//
//  FarmData.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 29.05.2022.
//

import SwiftUI

let farmsData: [Farm] = [
    Farm(
        title: "Ферма qarbyz.kz",
        image: "qarbyz.kz",
        fruitImage: "MelaniyaF1",
        rating: 4,
        location: "Шымкент",
        date: "2 дня",
        price: 799,
        sort: "Сорт: Мелания F1",
        description: """
Это крепкий сорт, устойчивый к различным погодным условиям и заболеваниям. Плоды арбуза овальные, основная окраска зеленая с широкими черно-зелеными полосами. Мякоть темно-красная, хрустящая с мелкими косточками.

Срок созревания 80-82 дня после появления всходов.

Средняя масса плодов 9-12 кг.
""",
        advantages: """
Хранение до месяца
Хорошо переносит перевозки
Устойчив к перепадам погоды
Невосприимчив к заболеваниям
""",
        watermelons: watermelons1
    ),
    Farm(
        title: "Ферма 7Say Farm",
        image: "7SAY farm",
        fruitImage: "AtamanF1",
        rating: 5,
        location: "Жетисай",
        date: "3 дня",
        price: 899,
        sort: "Атаман F1",
        description: """
Атаман F1 / Ataman F1 - гибрид арбуза очень раннего срока созревания. Плоды арбуза созревают, при прямом посеве семян в грунт, на 55 - 65 день после всходов, а при выращивании рассадным способом под укрытиями, на 40 - 45 день.

Мощное растение большой силы роста, с хорошо развитым листовым аппаратом, формирует при благоприятных условиях 4 - 5 плодов, со средним весом каждого - 12 - 16 кг. Плоды овальной формы, гладкие с глянцевым блеском, тёмно-зелёного со светлыми полосами окраса снаружи, с крепкой пружинящей корой, длительно сохраняют потребительские качества и отлично транспортируются.
""",
        advantages: """
Мякоть плодов насыщенного ярко-красного цвета, зернистая, сладкая, прекрасной консистенции и волшебного вкуса.

Гибрид устойчив к фузариозу и антракнозу и предназначен для выращивания ранней и суперранней продукции в открытом грунте и под плёночными укрытиями.

При выращивании на капельном орошении, более 100 тонн арбузов с гектара.
""",
        watermelons: watermelons2
    )
]
