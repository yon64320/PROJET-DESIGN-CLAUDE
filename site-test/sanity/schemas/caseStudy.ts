export default {
  name: 'caseStudy',
  title: 'Cas client',
  type: 'document',
  fields: [
    {
      name: 'sector',
      title: 'Secteur',
      type: 'string',
      description: 'Ex: "Conseil B2B", "Cabinet RH", "Architecte"',
      validation: (Rule: any) => Rule.required(),
    },
    {
      name: 'context',
      title: 'Contexte / Problème',
      type: 'text',
      rows: 3,
      description: 'Problème en 1-2 phrases — tel que l\'ICP le reconnaît',
      validation: (Rule: any) => Rule.required(),
    },
    {
      name: 'solution',
      title: 'Ce qu\'on a fait',
      type: 'array',
      of: [{ type: 'string' }],
      description: '2-3 bullets max',
    },
    {
      name: 'result',
      title: 'Résultat',
      type: 'text',
      rows: 2,
      description: 'Résultat qualitatif ou chiffre — anonymisé si nécessaire',
    },
    {
      name: 'image',
      title: 'Image / Screenshot',
      type: 'image',
      options: { hotspot: true },
    },
    {
      name: 'published',
      title: 'Publié',
      type: 'boolean',
      initialValue: false,
    },
  ],
}
