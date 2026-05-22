/**
 * Full-bleed liquid-glass backdrop — a soft blue / cyan / violet field that
 * shows through the transparent sidebar and the translucent white app panel.
 */
export function GradientBackground() {
  return (
    <div
      aria-hidden
      className="pointer-events-none fixed inset-0 -z-10 overflow-hidden"
    >
      {/* Base wash */}
      <div
        className="absolute inset-0"
        style={{
          background:
            'linear-gradient(155deg, #e9eeff 0%, #eef0ff 34%, #e8ebfb 64%, #e2ecff 100%)',
        }}
      />

      {/* Drifting colour blobs */}
      <div
        className="blob animate-blob-drift"
        style={{
          top: '-14%',
          left: '-8%',
          width: 660,
          height: 660,
          opacity: 0.62,
          background:
            'radial-gradient(circle at 35% 35%, #7da8ff 0%, #3a64ff 56%, transparent 73%)',
        }}
      />
      <div
        className="blob animate-blob-drift"
        style={{
          top: '4%',
          right: '-14%',
          width: 740,
          height: 740,
          opacity: 0.6,
          animationDelay: '-6s',
          background:
            'radial-gradient(circle at 50% 50%, #cbbcff 0%, #8b5cf6 56%, transparent 73%)',
        }}
      />
      <div
        className="blob animate-blob-drift"
        style={{
          bottom: '-22%',
          left: '24%',
          width: 820,
          height: 820,
          opacity: 0.58,
          animationDelay: '-12s',
          background:
            'radial-gradient(circle at 50% 50%, #a3e2ff 0%, #38bdf8 52%, transparent 73%)',
        }}
      />

      {/* Film-grain / noise overlay */}
      <div
        className="absolute inset-0 opacity-[0.03] mix-blend-overlay"
        style={{
          backgroundImage:
            "url(\"data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='160' height='160'><filter id='n'><feTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='2'/></filter><rect width='100%' height='100%' filter='url(%23n)' opacity='0.5'/></svg>\")",
        }}
      />
    </div>
  )
}
