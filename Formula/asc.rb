# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.4.4'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.4/asc_4.4.4_macOS_arm64'
      sha256 '06c8b00185d2c8e0d5a489b84f84afc9a02ff7b4dcf291991d0595c490968044'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.4/asc_4.4.4_macOS_amd64'
      sha256 '6bf8405adc774c9aae561a99327b8fc3ca40914700df6dfb19becdc029abd93a'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.4.4_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.4.4_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
