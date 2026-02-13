//
//  TarotCard+Data.swift
//  Lunara
//
//  Created by Alexandra on 12.02.26.
//

import SwiftUI

extension TarotCard {
    var title: String {
        switch self {
        case .fool: return "The Fool"
        case .magician: return "The Magician"
        case .highPriestess: return "The High Priestess"
        case .hierophant: return "The Hierophant"
        case .lovers: return "The Lovers"
        case .chariot: return "The Chariot"
        case .strength: return "Strength"
        case .hermit: return "The Hermit"
        case .temperance: return "Temperance"
        case .devil: return "The Devil"
        case .tower: return "The Tower"
        case .star: return "The Star"
        case .moon: return "The Moon"
        case .sun: return "The Sun"
        case .judgement: return "Judgement"
        case .world: return "The World"
        }
    }
    
    var imageAssetName: String {
        switch self {
        case .fool: return "Fool"
        case .magician: return "Magician"
        case .highPriestess: return "HighPriestess"
        case .hierophant: return "Hierophant"
        case .lovers: return "Lovers"
        case .chariot: return "Chariot"
        case .strength: return "Strength"
        case .hermit: return "Hermit"
        case .temperance: return "Temperance"
        case .devil: return "Devil"
        case .tower: return "Tower"
        case .star: return "Star"
        case .moon: return "Moon"
        case .sun: return "Sun"
        case .judgement: return "Judgement"
        case .world: return "World"
        }
    }
    
    var generalDescription: String {
        switch self {
        case .fool: return "The Fool represents the beginning of a journey where potential is wide open and the future is not yet defined. It speaks about stepping into the unknown with trust, curiosity, and a willingness to learn through direct experience rather than careful planning. This card carries a sense of freedom and innocence: the courage to act without being weighed down by past mistakes or expectations. At the same time, the Fool reminds us that naïveté can be both a gift and a risk. It suggests a leap of faith that can lead to growth and discovery, but only if one stays aware of their surroundings and takes responsibility for the consequences of their choices. Ultimately, the Fool is about embracing life as an adventure, accepting uncertainty, and allowing yourself to evolve through bold, authentic movement forward."
        case .magician: return "The Magician represents skill, resourcefulness, and the power to manifest your goals. It indicates the ability to harness available tools, knowledge, and talents to create desired outcomes. This card emphasizes focus, initiative, and the awareness that your potential is shaped by your intentions and actions."
        case .highPriestess: return "The High Priestess embodies intuition, mystery, and inner wisdom. It calls attention to the unseen, encouraging reflection, patience, and trusting your inner voice. Secrets, hidden knowledge, and the subtle guidance of your subconscious mind are central themes of this card."
        case .hierophant: return "The Hierophant signifies tradition, structure, and guidance from established systems or mentors. It represents learning, spiritual teaching, and aligning with shared values. This card encourages conformity in some aspects, as well as seeking counsel from trusted authorities."
        case .lovers: return "The Lovers represents connection, partnership, and meaningful choices in relationships. It reflects harmony, mutual attraction, and the balance of emotional and moral decisions. This card often points to significant choices where values and hearts align."
        case .chariot: return "The Chariot symbolizes determination, focus, and the drive to overcome obstacles. It represents ambition, discipline, and controlled forward motion. Success comes from harnessing conflicting forces with willpower and direction."
        case .strength: return "Strength embodies courage, patience, and inner resilience. It suggests mastering impulses, showing compassion, and finding power in gentleness rather than force. Confidence grows through self-awareness and balanced action."
        case .hermit: return "The Hermit signifies introspection, solitude, and seeking inner guidance. It encourages reflection, wisdom, and the search for truth within. This card emphasizes patience and understanding gained through personal contemplation."
        case .temperance: return "Temperance represents balance, moderation, and harmony. It encourages blending different aspects of life, patience, and finding equilibrium. This card signifies cooperation, adaptability, and measured progress."
        case .devil: return "The Devil reflects attachment, temptation, and facing shadow aspects of oneself. It highlights the need to recognize unhealthy patterns, fears, and dependencies. This card serves as a reminder to reclaim freedom through awareness and conscious choices."
        case .tower: return "The Tower signals sudden upheaval, revelation, or destruction of false structures. It often represents a breakthrough following chaos, forcing clarity and transformation. Though challenging, it clears the way for growth and rebuilding."
        case .star: return "The Star embodies hope, inspiration, and renewal. It signifies faith in the future, guidance from a higher perspective, and serenity. This card encourages optimism and a clear vision of possibilities."
        case .moon: return "The Moon represents intuition, illusions, and the subconscious mind. It highlights uncertainty, emotional flux, and the need to navigate hidden truths. This card encourages caution and listening to inner guidance."
        case .sun: return "The Sun symbolizes vitality, joy, and clarity. It reflects success, optimism, and positive energy. This card brings illumination, confidence, and the satisfaction of achievement."
        case .judgement: return "Judgement signifies awakening, self-reflection, and the evaluation of past actions. It calls for accountability, renewal, and embracing transformative insights. This card marks the opportunity for rebirth or major life decisions."
        case .world: return "The World represents completion, fulfillment, and integration. It signifies accomplishment, wholeness, and the successful conclusion of a journey. This card embodies harmony, achievement, and the realization of goals."
        }
    }
    
    var loveDescription: String {
        switch self {
        case .fool: return "In the context of love, the Fool signifies a new emotional journey filled with openness, spontaneity, and a willingness to take a heartfelt risk. It points to entering a relationship—or approaching love itself—with curiosity and trust, without being overly constrained by past experiences or fears. This card reflects a light, free-spirited energy where connection grows through presence and shared discovery rather than expectations or rigid definitions. At the same time, the Fool carries a reminder to stay aware: emotional innocence can invite joy, but it can also lead to overlooking red flags if boundaries are ignored. In love, the Fool ultimately encourages embracing vulnerability and allowing feelings to unfold naturally, while remaining mindful of your own emotional well-being as the connection develops."
        case .magician: return "In love, the Magician represents attraction, charisma, and the ability to actively create meaningful connections. It suggests taking initiative, communicating intentions clearly, and using personal charm to foster relationships."
        case .highPriestess: return "The High Priestess in love points to emotional depth, intuition, and subtle understanding. It may indicate hidden feelings, unspoken emotions, or the need to trust your instincts in matters of the heart."
        case .hierophant: return "The Hierophant reflects traditional or committed relationships, shared values, and guidance from trusted sources. It encourages forming bonds rooted in respect, commitment, and shared beliefs."
        case .lovers: return "The Lovers signifies harmony, mutual attraction, and meaningful emotional choice. It reflects strong connections, alignment of values, and the importance of conscious decisions in love."
        case .chariot: return "In love, the Chariot represents determination, pursuit, and overcoming obstacles to strengthen the relationship. It may indicate actively driving progress or taking decisive steps to unite hearts."
        case .strength: return "Strength in love embodies patience, compassion, and emotional resilience. It highlights the power of gentle influence, support, and courage within a partnership."
        case .hermit: return "The Hermit suggests introspection and reflection in relationships. It may indicate a period of solitude, thoughtful evaluation, or seeking clarity before deepening emotional bonds."
        case .temperance: return "Temperance represents balance, compromise, and harmony in relationships. It encourages patience, adaptability, and blending different perspectives to foster a healthy connection."
        case .devil: return "The Devil in love warns of attachment, obsession, or unhealthy dependency. It highlights the need to recognize limiting patterns and regain freedom in emotional relationships."
        case .tower: return "The Tower indicates sudden change, upheaval, or revelations in love. It can signal disruptive events that ultimately bring clarity or lead to a necessary transformation in relationships."
        case .star: return "The Star reflects hope, healing, and inspiration in love. It encourages faith, optimism, and emotional renewal, bringing a sense of calm and possibility to relationships."
        case .moon: return "The Moon points to uncertainty, illusions, or hidden emotions in love. It advises caution, awareness, and trusting intuition when navigating complex feelings."
        case .sun: return "The Sun symbolizes joy, clarity, and happiness in relationships. It indicates warmth, mutual satisfaction, and positive energy shared between partners."
        case .judgement: return "Judgement in love suggests awakening, self-reflection, and reconciliation. It may indicate making conscious choices, forgiveness, or embracing transformative emotional growth."
        case .world: return "The World represents fulfillment, completion, and harmony in love. It indicates the successful integration of emotional experiences, satisfaction, and a sense of wholeness within relationships."
        }
    }
    
    var careerDescription: String {
        switch self {
        case .fool: return "In a career context, the Fool points to a fresh start, a new professional path, or an unconventional opportunity that invites you to step beyond what feels safe or familiar. It reflects openness to learning, experimentation, and growth through real-world experience rather than rigid structures or long-term guarantees. This card often appears when you are drawn to a role, project, or direction driven more by curiosity and enthusiasm than by stability or logic. At the same time, the Fool cautions against acting without awareness: enthusiasm should be balanced with a basic understanding of risks and responsibilities. In essence, the Fool in career matters encourages trusting your inner drive and being brave enough to begin, while staying conscious of where your choices may lead as you move forward into unknown professional territory."
        case .magician: return "In career matters, the Magician represents skill, initiative, and the ability to manifest professional goals. It suggests leveraging talents, resources, and creativity to create opportunities and achieve success."
        case .highPriestess: return "The High Priestess encourages reflection, intuition, and insight in professional settings. It points to understanding hidden dynamics, relying on intuition, and learning through observation rather than immediate action."
        case .hierophant: return "The Hierophant in career reflects structured guidance, mentorship, and adherence to established practices. It suggests learning from tradition, training, or working within respected systems."
        case .lovers: return "The Lovers indicates choices and partnerships in career. It reflects collaboration, alignment of values with colleagues or projects, and making conscious decisions that honor both personal and professional integrity."
        case .chariot: return "The Chariot symbolizes ambition, focus, and the drive to succeed professionally. It encourages determination, discipline, and overcoming obstacles to achieve career goals."
        case .strength: return "Strength in career embodies perseverance, resilience, and leadership through patience. It highlights the importance of self-control, confidence, and steady progress in achieving objectives."
        case .hermit: return "The Hermit suggests introspection, strategic thinking, and independent work. It encourages seeking clarity, deep understanding, and learning from solitude before making career moves."
        case .temperance: return "Temperance represents balance, adaptability, and harmonious collaboration in career matters. It encourages measured action, compromise, and integrating different skills or approaches."
        case .devil: return "The Devil warns against unhealthy attachments, materialism, or restrictive patterns at work. It suggests recognizing limitations, breaking free from dependency, and reclaiming autonomy in your professional life."
        case .tower: return "The Tower indicates sudden change, disruption, or upheaval in career. While challenging, it clears the way for new structures, opportunities, and necessary transformations."
        case .star: return "The Star represents inspiration, hope, and renewed motivation in career. It encourages setting clear goals, trusting guidance, and remaining optimistic for future opportunities."
        case .moon: return "The Moon suggests uncertainty, hidden factors, or unclear paths in career matters. It emphasizes caution, reflection, and trusting intuition when navigating professional decisions."
        case .sun: return "The Sun symbolizes success, clarity, and recognition in career. It reflects positive outcomes, confidence, and the achievement of goals through skill and effort."
        case .judgement: return "Judgement in career points to evaluation, awakening, and making significant decisions. It encourages reflection on past actions and using insights to embrace professional growth or transformation."
        case .world: return "The World represents completion, achievement, and integration in career. It signifies the successful culmination of projects, recognition of efforts, and the realization of professional goals."
        }
    }
    
    var keys: [String] {
        switch self {
        case .fool: return ["beginnings", "freedom", "adventure", "potential", "spontaneity"]
        case .magician: return ["skill", "manifestation", "resourcefulness", "focus", "action"]
        case .highPriestess: return ["intuition", "wisdom", "mystery", "subconscious", "patience"]
        case .hierophant: return ["tradition", "guidance", "learning", "values", "mentorship"]
        case .lovers: return ["connection", "choices", "harmony", "partnership", "alignment"]
        case .chariot: return ["determination", "control", "ambition", "drive", "willpower"]
        case .strength: return ["courage", "patience", "resilience", "compassion", "confidence"]
        case .hermit: return ["introspection", "solitude", "wisdom", "reflection", "clarity"]
        case .temperance: return ["balance", "harmony", "moderation", "cooperation", "adaptability"]
        case .devil: return ["attachment", "temptation", "shadow", "dependency", "awareness"]
        case .tower: return ["upheaval", "revelation", "chaos", "transformation", "clarity"]
        case .star: return ["hope", "inspiration", "renewal", "faith", "serenity"]
        case .moon: return ["intuition", "illusion", "uncertainty", "subconscious", "reflection"]
        case .sun: return ["joy", "clarity", "success", "vitality", "positivity"]
        case .judgement: return ["awakening", "reflection", "transformation", "accountability", "rebirth"]
        case .world: return ["completion", "fulfillment", "integration", "achievement", "wholeness"]
        }
    }
}
